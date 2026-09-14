# Sierra SCI Fonts

This repo contains the JSON source files for compiling Sierra On-Line SCI0/01 FONT resources
into usable OTF/WOFF2 fonts using [@4bitlabs/sciotf](https://github.com/32bitkid/sci.js/tree/main/apps/sciotf).

## Prerequisites

- `make`
- [`Node.js`](https://nodejs.org/en) >=24.11.0
- [`jq`](https://jqlang.org/)

## Aspect Ratio Correction

The EGA modes that these fonts were originally displayed on did not have square 1&ratio;1 aspect-ratio pixels, instead had
a display aspect-ratio of 1&ratio;1.2 (or the closest integer scaling of 5&ratio;6).

- `SciAC` prefixed fonts are "aspect-ratio correct"
- `SciPX` prefixed fonts are "square-pixel fonts"

## Variants

- **Free** - Basic Latin/ASCII glyphs from freely available demo and promotional content from Sierra On-Line.
- **Full** - Built with glyphs from retail content from Sierra On-Line, with many glyphs altered and/or adjusted for bettter localization support.

## Supported Fonts

General overview of the glyphs that each version supports.

### FONT.000

| Font            | <small>Basic Latin</small> | <small>Latin-1<br>Supplement</small> | AC <small>(1&ratio;1.2)</small> | PX <small>(1&ratio;1)</mall> | 
|-----------------|:--------------------------:|:------------------------------------:|:-------------------------------:|:----------------------------:|
| `FONT.000 Free` |             ✅             |                                      |               ✅                |              ✅              |
| `FONT.000`      |             ✅             |                  ✅                  |               ✅                |              ✅              | 

<img width="750" height="450" alt="sciAC-font-000" src="https://github.com/user-attachments/assets/38f0e137-8907-4b09-8a47-63124449da71" />

### FONT.001

| Font            | <small>Basic Latin</small> | <small>Latin-1<br>Supplement</small> | AC <small>(1&ratio;1.2)</small> | PX <small>(1&ratio;1)</mall> | 
|-----------------|:--------------------------:|:------------------------------------:|:-------------------------------:|:----------------------------:|
| `FONT.001 Free` |             ✅             |                                      |               ✅                |              ✅              | 
| `FONT.001 Pure` |             ✅             |                  ✅                  |               ✅                |              ✅              | 

<img width="750" height="450" alt="sciAC-font-001" src="https://github.com/user-attachments/assets/4344271c-0ffe-496a-9e1d-5ad58176bca9" />

### FONT.004

| Font            | <small>Basic Latin</small> | <small>Latin-1<br>Supplement</small> | AC <small>(1&ratio;1.2)</small> | PX <small>(1&ratio;1)</mall> | 
|-----------------|:--------------------------:|:------------------------------------:|:-------------------------------:|:----------------------------:|
| `FONT.004 Free` |             ✅             |                                      |               ✅                |              ✅              | 
| `FONT.004`      |             ✅             |                  ✅                  |               ✅                |              ✅              | 

<img width="750" height="450" alt="sciAC-font-004" src="https://github.com/user-attachments/assets/ed9ca5cb-27e9-4876-b8c6-0e11b41e4dc5" />

### FONT.300

| Font            | <small>Basic Latin</small> | <small>Latin-1<br>Supplement</small> | AC <small>(1&ratio;1.2)</small> | PX <small>(1&ratio;1)</mall> | 
|-----------------|:--------------------------:|:------------------------------------:|:-------------------------------:|:----------------------------:|
| `FONT.300 Free` |             ✅             |                                      |               ✅                |              ✅              | 
| `FONT.300`      |             ✅             |                  ✅                  |               ✅                |              ✅              |  

<img width="750" height="450" alt="sciAC-font-300" src="https://github.com/user-attachments/assets/779d16af-0eba-4d66-b96b-4cc7595614f7" />

### FONT.999

| Font            | <small>Basic Latin</small> | <small>Latin-1<br>Supplement</small> | AC <small>(1&ratio;1.2)</small> | PX <small>(1&ratio;1)</mall> | 
|-----------------|:--------------------------:|:------------------------------------:|:-------------------------------:|:----------------------------:|
| `FONT.004 Free` |             ✅             |                                      |               ✅                |              ✅              | 
| `FONT.004`      |             ✅             |                  ✅                  |               ✅                |              ✅              | 

<img width="750" height="450" alt="sciAC-font-999" src="https://github.com/user-attachments/assets/a065a147-28af-4894-a593-5b7fcd8ff3b7" />

## Compiling

Create a `Makefile.local` file and resolve all the paths on your local machine. Then run:

```bash
make update-defs
```

This will update all the defs with paths, then you can build fonts with.

```bash
make build # will build all otfs & woff2
```

## Hand-Compiling Fonts

Update FONT `.json` files to resolve all the *sources* required for that font. See the `README` files in 
the `./defs` folder for more details on what is required for each font. Once that is done, you can run the
following to generate an OTF file. For example, to build `SciAC FONT.000` and `SciPX FONT.000`, you run: 

```bash
npx @4bitlabs/sciotf advanced defs/font.000.json --aspect-ratio 1:1.2 --chamfer inner
npx @4bitlabs/sciotf advanced defs/font.000.json --aspect-ratio 1:1 --chamfer none
```

See `@4bitlabs/sciotf` for full options.
