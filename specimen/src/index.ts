#!/usr/bin/env node
import { readFile } from "node:fs/promises";
import { createCanvas } from "@napi-rs/canvas";
import opentype from "opentype.js";

const panic = (message: string): never => {
	console.error(`ERROR: ${message}`);
	process.exit(-1);
};

function mustExist<T>(value: T | null | undefined): asserts value is T {
	if (!value) panic("file not found");
}

const canvas = createCanvas(600, 400);
const ctx = canvas.getContext("2d");
const cnvCtx = ctx as unknown as CanvasRenderingContext2D;

const fileName = process.argv[2];
mustExist(fileName);

const otf = await readFile(fileName);
const font = opentype.parse(otf);

ctx.fillStyle = "white";
ctx.fillRect(0, 0, 600, 400);
ctx.fillStyle = "black";

function* chunksOf(glyphs: opentype.GlyphSet, size: number) {
	const chunk = [];
	for (let i = 0; i < glyphs.length; i++) {
		const glyph = glyphs.get(i);
		if (glyph.unicodes.length === 0) continue;
		if (glyph.unicodes.includes(0x20)) continue;
		if (glyph.unicodes.includes(0x09)) continue;
		chunk.push(glyph);
		if (chunk.length >= size) {
			yield chunk;
			chunk.length = 0;
		}
	}
	if (chunk.length > 0) yield chunk;
}

const lineHeight = (size: number) =>
	(font.ascender - font.descender) * (size / font.unitsPerEm);

const getAdvanceWidth = (glyph: opentype.Glyph, size: number) =>
	(glyph.advanceWidth ?? size) * (size / font.unitsPerEm);

font.draw(cnvCtx, font.getEnglishName("fontFamily"), 25, 110, 16 * 4);

font.draw(
	ctx as unknown as CanvasRenderingContext2D,
	"a Sierra On-Line Typeface",
	45,
	110 + lineHeight(16),
	16,
);

let y = 170;
for (const chunk of chunksOf(font.glyphs, 32)) {
	let x = 45;
	for (const glyph of chunk) {
		glyph.draw(cnvCtx, x, y, 24);
		x += Math.ceil(getAdvanceWidth(glyph, 24));
	}
	y += lineHeight(24) + 2;
}

process.stdout.write(canvas.toBuffer("image/png"));
