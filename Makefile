SCI_FONT_000_A ?= /path/to/source_a
SCI_FONT_000_B ?= /path/to/source_b
SCI_FONT_000_C ?= /path/to/source_c
SCI_FONT_000_D ?= /path/to/source_d
SCI_FONT_000_E ?= /path/to/source_e
SCI_FONT_000_F ?= /path/to/source_f
SCI_FONT_000_G ?= /path/to/source_g/font.000
SCI_FONT_000_H ?= /path/to/source_h
SCI_FONT_000_I ?= /path/to/source_i
SCI_FONT_000_J ?= /path/to/source_j

SCI_FONT_300_A ?= /path/to/source_a
SCI_FONT_300_B ?= /path/to/source_b
SCI_FONT_300_C ?= /path/to/source_c

SCI_FONT_001_A ?= /path/to/source_a
SCI_FONT_001_B ?= /path/to/source_b
SCI_FONT_001_C ?= /path/to/source_c
SCI_FONT_001_D ?= /path/to/source_d
SCI_FONT_001_E ?= /path/to/source_e

ifneq ($(RESET), 1)
	-include Makefile.local
endif


build: fonts

fonts:
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.json      -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.json      -f otf -f woff2 -a 1:1   -c none   -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.free.json -f otf -f woff2 -a 1:1   -c none   -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.000.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist

	@npx -q @4bitlabs/sciotf advanced ./defs/font.001.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.001.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.001.free.json -f otf -f woff2 -a 1:1   -c none   -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.001.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist

	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.json      -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.json      -f otf -f woff2 -a 1:1   -c none   -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.free.json -f otf -f woff2 -a 1:1   -c none   -o dist
	@npx -q @4bitlabs/sciotf advanced ./defs/font.300.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist

clean:
	rm -f ./dist/sciAC-*.otf ./dist/sciPX-*.otf ./dist/sciAC-*.woff2 ./dist/sciPX-*.woff2

update-defs: update-font-000-def \
			 update-font-000-pure-def \
			 update-font-000-free-def \
			 update-font-001-pure-def \
			 update-font-001-free-def \
			 update-font-300-def \
			 update-font-300-pure-def \
			 update-font-300-free-def

update-font-000-def:
	@TMPFILE=$$(mktemp); \
	jq "\
	.sources[0].root = \"$(SCI_FONT_000_A)\" | \
	.sources[1].root = \"$(SCI_FONT_000_B)\" | \
	.sources[2].root = \"$(SCI_FONT_000_C)\" | \
	.sources[3].root = \"$(SCI_FONT_000_D)\" | \
	.sources[4].root = \"$(SCI_FONT_000_E)\" | \
	.sources[5].root = \"$(SCI_FONT_000_F)\" | \
	.sources[6].path = \"$(SCI_FONT_000_G)\" | \
	.sources[7].root = \"$(SCI_FONT_000_H)\" | \
	.sources[8].root = \"$(SCI_FONT_000_I)\" \
	" ./defs/font.000.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.000.json

update-font-000-pure-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_000_A)\" | \
	.sources[1].root = \"$(SCI_FONT_000_B)\" | \
	.sources[2].root = \"$(SCI_FONT_000_C)\" | \
	.sources[3].root = \"$(SCI_FONT_000_D)\" | \
	.sources[4].root = \"$(SCI_FONT_000_E)\" | \
	.sources[5].root = \"$(SCI_FONT_000_F)\" | \
	.sources[6].path = \"$(SCI_FONT_000_G)\" | \
	.sources[7].root = \"$(SCI_FONT_000_H)\" | \
	.sources[8].root = \"$(SCI_FONT_000_I)\" \
	" ./defs/font.000.pure.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.000.pure.json

update-font-000-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_000_A)\" | \
	.sources[1].root = \"$(SCI_FONT_000_B)\" | \
	.sources[2].root = \"$(SCI_FONT_000_J)\" \
	" ./defs/font.000.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.000.free.json

update-font-300-def:
	@TMPFILE=$$(mktemp); \
	jq "\
	.sources[0].root = \"$(SCI_FONT_300_A)\" | \
	.sources[1].root = \"$(SCI_FONT_300_B)\" | \
	.sources[2].root = \"$(SCI_FONT_300_C)\" | \
	.sources[3].root = \"$(SCI_FONT_300_A)\" \
	" ./defs/font.300.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.300.json

update-font-300-pure-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_300_A)\" | \
	.sources[1].root = \"$(SCI_FONT_300_B)\" | \
	.sources[2].root = \"$(SCI_FONT_300_C)\" \
	" ./defs/font.300.pure.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.300.pure.json

update-font-300-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_300_A)\" \
	" ./defs/font.300.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.300.free.json

update-font-001-pure-def:
	@TMPFILE=$$(mktemp); \
	jq "\
	.sources[0].root = \"$(SCI_FONT_001_A)\" | \
	.sources[1].root = \"$(SCI_FONT_001_A)\" | \
	.sources[2].root = \"$(SCI_FONT_001_B)\" | \
	.sources[3].path = \"$(SCI_FONT_001_C)\" | \
	.sources[4].root = \"$(SCI_FONT_001_D)\" | \
	.sources[5].root = \"$(SCI_FONT_001_E)\" \
	" ./defs/font.001.pure.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.001.pure.json

update-font-001-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_001_A)\" | \
	.sources[1].root = \"$(SCI_FONT_001_B)\" \
	" ./defs/font.001.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.001.free.json

