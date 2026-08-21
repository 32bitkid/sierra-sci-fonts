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

SCI_FONT_001_A ?= /path/to/source_a
SCI_FONT_001_B ?= /path/to/source_b
SCI_FONT_001_C ?= /path/to/source_c
SCI_FONT_001_D ?= /path/to/source_d
SCI_FONT_001_E ?= /path/to/source_e

SCI_FONT_004_A ?= /path/to/source_a
SCI_FONT_004_B ?= /path/to/source_b
SCI_FONT_004_C ?= /path/to/source_c

SCI_FONT_200_A ?= /path/to/source_a

SCI_FONT_300_A ?= /path/to/source_a
SCI_FONT_300_B ?= /path/to/source_b
SCI_FONT_300_C ?= /path/to/source_c

SCI_FONT_999_A ?= /path/to/source_a

#SCIOTF_BIN = "npx -q @4bitlabs/sciotf"
SCIOTF_BIN = "../sci.js/apps/sciotf/dist/main.mjs"

ifneq ($(RESET), 1)
	-include Makefile.local
endif

build: fonts

dist-folders:
	mkdir -p dist/font-000
	mkdir -p dist/font-001
	mkdir -p dist/font-004
	mkdir -p dist/font-200
	mkdir -p dist/font-300
	mkdir -p dist/font-999

fonts: dist-folders
	$(SCIOTF_BIN) advanced ./defs/font.000.json      -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-000 --verbose > ./dist/font-000/sciAC-font-000.md
	$(SCIOTF_BIN) advanced ./defs/font.000.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-000 --verbose > ./dist/font-000/sciAC-font-000-free.md
	$(SCIOTF_BIN) advanced ./defs/font.000.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-000 --verbose > ./dist/font-000/sciAC-font-000-pure.md
	$(SCIOTF_BIN) advanced ./defs/font.000.json      -f otf -f woff2 -a 1:1   -c none   -o dist/font-000 --verbose > ./dist/font-000/sciPX-font-000.md
	$(SCIOTF_BIN) advanced ./defs/font.000.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-000 --verbose > ./dist/font-000/sciPX-font-000-free.md
	$(SCIOTF_BIN) advanced ./defs/font.000.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-000 --verbose > ./dist/font-000/sciPX-font-000-pure.md

	$(SCIOTF_BIN) advanced ./defs/font.001.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-001 --verbose > ./dist/font-001/sciAC-font-001-free.md
	$(SCIOTF_BIN) advanced ./defs/font.001.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-001 --verbose > ./dist/font-001/sciAC-font-001-pure.md
	$(SCIOTF_BIN) advanced ./defs/font.001.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-001 --verbose > ./dist/font-001/sciPX-font-001-free.md
	$(SCIOTF_BIN) advanced ./defs/font.001.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-001 --verbose > ./dist/font-001/sciPX-font-001-pure.md

	$(SCIOTF_BIN) advanced ./defs/font.004.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-004 --verbose > ./dist/font-004/sciAC-font-004-free.md
	$(SCIOTF_BIN) advanced ./defs/font.004.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-004 --verbose > ./dist/font-004/sciAC-font-004-pure.md
	$(SCIOTF_BIN) advanced ./defs/font.004.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-004 --verbose > ./dist/font-004/sciPX-font-004-free.md
	$(SCIOTF_BIN) advanced ./defs/font.004.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-004 --verbose > ./dist/font-004/sciPX-font-004-pure.md

	$(SCIOTF_BIN) advanced ./defs/font.200.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-200 --verbose > ./dist/font-200/sciAC-font-200-free.md
	$(SCIOTF_BIN) advanced ./defs/font.200.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-200 --verbose > ./dist/font-200/sciPX-font-200-free.md

	$(SCIOTF_BIN) advanced ./defs/font.300.json      -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-300 --verbose > ./dist/font-300/sciAC-font-300.md
	$(SCIOTF_BIN) advanced ./defs/font.300.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-300 --verbose > ./dist/font-300/sciAC-font-300-free.md
	$(SCIOTF_BIN) advanced ./defs/font.300.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-300 --verbose > ./dist/font-300/sciAC-font-300-pure.md
	$(SCIOTF_BIN) advanced ./defs/font.300.json      -f otf -f woff2 -a 1:1   -c none   -o dist/font-300 --verbose > ./dist/font-300/sciPX-font-300.md
	$(SCIOTF_BIN) advanced ./defs/font.300.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-300 --verbose > ./dist/font-300/sciPX-font-300-free.md
	$(SCIOTF_BIN) advanced ./defs/font.300.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-300 --verbose > ./dist/font-300/sciPX-font-300-pure.md

	$(SCIOTF_BIN) advanced ./defs/font.999.free.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-999 --verbose > ./dist/font-999/sciAC-font-999-free.md
	$(SCIOTF_BIN) advanced ./defs/font.999.pure.json -f otf -f woff2 -a 1:1.2 -c inside -o dist/font-999 --verbose > ./dist/font-999/sciAC-font-999-pure.md
	$(SCIOTF_BIN) advanced ./defs/font.999.free.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-999 --verbose > ./dist/font-999/sciPX-font-999-free.md
	$(SCIOTF_BIN) advanced ./defs/font.999.pure.json -f otf -f woff2 -a 1:1   -c none   -o dist/font-999 --verbose > ./dist/font-999/sciPX-font-999-pure.md

clean:
	rm -fr ./dist/**/*.otf ./dist/**/*.woff2

update-defs: update-font-000-def \
			 update-font-000-pure-def \
			 update-font-000-free-def \
			 update-font-001-pure-def \
			 update-font-001-free-def \
			 update-font-004-pure-def \
			 update-font-004-free-def \
			 update-font-200-free-def \
			 update-font-300-def \
			 update-font-300-pure-def \
			 update-font-300-free-def \
			 update-font-999-pure-def \
			 update-font-999-free-def

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

update-font-004-pure-def:
	@TMPFILE=$$(mktemp); \
	jq "\
	.sources[0].root = \"$(SCI_FONT_004_A)\" | \
	.sources[1].root = \"$(SCI_FONT_004_B)\" | \
	.sources[2].path = \"$(SCI_FONT_004_C)\" \
	" ./defs/font.004.pure.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.004.pure.json

update-font-004-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_004_A)\" \
	" ./defs/font.004.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.004.free.json

update-font-200-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_200_A)\" \
	" ./defs/font.200.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.200.free.json

update-font-999-pure-def:
	@TMPFILE=$$(mktemp); \
	jq "\
	.sources[0].root = \"$(SCI_FONT_999_A)\" \
	" ./defs/font.999.pure.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.999.pure.json

update-font-999-free-def:
	@TMPFILE=$$(mktemp) && \
	jq "\
	.sources[0].root = \"$(SCI_FONT_999_A)\" \
	" ./defs/font.999.free.json > "$$TMPFILE" && \
	cp $$TMPFILE ./defs/font.999.free.json

specimen: dist-folders rebuild-specimen
	./specimen/dist/index.mjs ./dist/font-000/sciAC-font-000-free.otf > ./dist/font-000/sciAC-font-000-free.png
	./specimen/dist/index.mjs ./dist/font-001/sciAC-font-001-free.otf > ./dist/font-001/sciAC-font-001-free.png
	./specimen/dist/index.mjs ./dist/font-004/sciAC-font-004-free.otf > ./dist/font-004/sciAC-font-004-free.png
	./specimen/dist/index.mjs ./dist/font-200/sciAC-font-200-free.otf > ./dist/font-200/sciAC-font-200-free.png
	./specimen/dist/index.mjs ./dist/font-300/sciAC-font-300-free.otf > ./dist/font-300/sciAC-font-300-free.png
	./specimen/dist/index.mjs ./dist/font-999/sciAC-font-999-free.otf > ./dist/font-999/sciAC-font-999-free.png

	./specimen/dist/index.mjs ./dist/font-000/sciAC-font-000-pure.otf > ./dist/font-000/sciAC-font-000-pure.png
	./specimen/dist/index.mjs ./dist/font-001/sciAC-font-001-pure.otf > ./dist/font-001/sciAC-font-001-pure.png
	./specimen/dist/index.mjs ./dist/font-004/sciAC-font-004-pure.otf > ./dist/font-004/sciAC-font-004-pure.png
	# ./specimen/dist/index.mjs ./dist/font-200/sciAC-font-200-pure.otf > ./dist/font-200/sciAC-font-200-pure.png
	./specimen/dist/index.mjs ./dist/font-300/sciAC-font-300-pure.otf > ./dist/font-300/sciAC-font-300-pure.png
	./specimen/dist/index.mjs ./dist/font-999/sciAC-font-999-pure.otf > ./dist/font-999/sciAC-font-999-pure.png

	./specimen/dist/index.mjs ./dist/font-000/sciAC-font-000.otf > ./dist/font-000/sciAC-font-000.png
	./specimen/dist/index.mjs ./dist/font-300/sciAC-font-300.otf > ./dist/font-300/sciAC-font-300.png

	./specimen/dist/index.mjs ./dist/font-000/sciPX-font-000-free.otf > ./dist/font-000/sciPX-font-000-free.png
	./specimen/dist/index.mjs ./dist/font-001/sciPX-font-001-free.otf > ./dist/font-001/sciPX-font-001-free.png
	./specimen/dist/index.mjs ./dist/font-004/sciPX-font-004-free.otf > ./dist/font-004/sciPX-font-004-free.png
	./specimen/dist/index.mjs ./dist/font-200/sciPX-font-200-free.otf > ./dist/font-200/sciPX-font-200-free.png
	./specimen/dist/index.mjs ./dist/font-300/sciPX-font-300-free.otf > ./dist/font-300/sciPX-font-300-free.png
	./specimen/dist/index.mjs ./dist/font-999/sciPX-font-999-free.otf > ./dist/font-999/sciPX-font-999-free.png

	./specimen/dist/index.mjs ./dist/font-000/sciPX-font-000-pure.otf > ./dist/font-000/sciPX-font-000-pure.png
	./specimen/dist/index.mjs ./dist/font-001/sciPX-font-001-pure.otf > ./dist/font-001/sciPX-font-001-pure.png
	./specimen/dist/index.mjs ./dist/font-004/sciPX-font-004-pure.otf > ./dist/font-004/sciPX-font-004-pure.png
	# ./specimen/dist/index.mjs ./dist/font-200/sciPX-font-200-pure.otf > ./dist/font-200/sciPX-font-200-pure.png
	./specimen/dist/index.mjs ./dist/font-300/sciPX-font-300-pure.otf > ./dist/font-300/sciPX-font-300-pure.png
	./specimen/dist/index.mjs ./dist/font-999/sciPX-font-999-pure.otf > ./dist/font-999/sciPX-font-999-pure.png

	./specimen/dist/index.mjs ./dist/font-000/sciPX-font-000.otf > ./dist/font-000/sciPX-font-000.png
	./specimen/dist/index.mjs ./dist/font-300/sciPX-font-300.otf > ./dist/font-300/sciPX-font-300.png

rebuild-specimen:
	cd specimen && npm run build
