#!/usr/bin/env node
import { readFile } from "node:fs/promises";
import { createCanvas } from "@napi-rs/canvas";
import opentype from "opentype.js";

function* asGlyphsOf(font: opentype.Font, chars: Iterable<string>) {
	for (const c of chars) {
		const glyph = font.charToGlyph(c);
		if (!glyph) continue;
		if (glyph.unicodes.length === 0) continue;
		if (glyph.unicodes.includes(0x20)) continue;
		if (glyph.unicodes.includes(0x09)) continue;
		yield glyph;
	}
}

function* charRange(start: string, end: string) {
	for (let i = start.charCodeAt(0); i <= end.charCodeAt(0); i++) {
		yield String.fromCharCode(i);
	}
}

function* allGlyphs(glyphs: opentype.GlyphSet) {
	for (let i = 0; i < glyphs.length; i++) {
		const glyph = glyphs.get(i);
		if (glyph.unicodes.length === 0) continue;
		if (glyph.unicodes.includes(0x20)) continue;
		if (glyph.unicodes.includes(0x09)) continue;
		yield glyph;
	}
}

function* union(...generators: Iterable<string>[]) {
	for (const gen of generators) yield* gen;
}

const panic = (message: string): never => {
	console.error(`ERROR: ${message}`);
	process.exit(-1);
};

function mustExist<T>(value: T | null | undefined): asserts value is T {
	if (!value) panic("file not found");
}

const fileName = process.argv[2];
mustExist(fileName);

const otf = await readFile(fileName);
const font = opentype.parse(otf);

const lineHeight = (size: number) =>
	(font.ascender - font.descender) * (size / font.unitsPerEm);

const getAdvanceWidth = (glyph: opentype.Glyph, size: number) =>
	(glyph.advanceWidth ?? size) * (size / font.unitsPerEm);

const WIDTH = 750;

const canvas = createCanvas(WIDTH, 450);
const ctx = canvas.getContext("2d");
const cnvCtx = ctx as unknown as CanvasRenderingContext2D;

ctx.fillStyle = "white";
ctx.fillRect(0, 0, WIDTH, 450);
ctx.fillStyle = "black";

font.draw(cnvCtx, font.getEnglishName("fontFamily"), 25, 80, 16 * 3);
ctx.fillStyle = "black";
font.draw(cnvCtx, "a Sierra On-Line Typeface", 45, 80 + lineHeight(16), 16);

const visited = new Set<opentype.Glyph>();
function* unvisited(it: Iterable<opentype.Glyph>) {
	for (const gl of it) if (!visited.has(gl)) yield gl;
}

function drawGlyphs(
	[ix, y]: [number, number],
	glyphs: Iterable<opentype.Glyph>,
	{ size = 32 }: { size?: number } = {},
): [number, number] {
	let x = ix;
	let crlf = false;

	for (const glyph of glyphs) {
		const w = Math.ceil(getAdvanceWidth(glyph, size));
		if (x + w > WIDTH - 40) {
			x = ix;
			y += lineHeight(size) + 4;
			crlf = false;
		}
		glyph.draw(cnvCtx, x, y, size);
		visited.add(glyph);
		x += w;
		crlf = true;
	}

	if (crlf) y += lineHeight(size) + 4;
	return [x, y];
}

let y = 140;
[, y] = drawGlyphs([40, y], asGlyphsOf(font, charRange("A", "Z")));
[, y] = drawGlyphs([40, y], asGlyphsOf(font, charRange("a", "z")));
[, y] = drawGlyphs([40, y], asGlyphsOf(font, charRange("0", "9")));

const symbols = union(charRange("!", "~"), charRange("\u00A1", "\u00BF"), [
	"\u00D7",
	"\u00F7",
]);
[, y] = drawGlyphs([40, y], unvisited(asGlyphsOf(font, symbols)));

const latin1Supplement = union(
	charRange("\u00C0", "\u00D6"),
	charRange("\u00D8", "\u00F6"),
	charRange("\u00F8", "\u00FF"),
);
[, y] = drawGlyphs([40, y], unvisited(asGlyphsOf(font, latin1Supplement)));

const otherSymbols = union(
	charRange("\u2000", "\u206f"),
	charRange("\u2190", "\u21fF"),
	charRange("\u25A0", "\u25FF"),
	charRange("\u2600", "\u26FF"),
);
[, y] = drawGlyphs([40, y], unvisited(asGlyphsOf(font, otherSymbols)));
[, y] = drawGlyphs([40, y], unvisited(allGlyphs(font.glyphs)));

process.stdout.write(canvas.toBuffer("image/png"));
