# Sierra SCI Fonts

This repo contains the JSON source files for compiling Sierra On-Line SCI0/01 FONT resources
into usable OTF/WOFF2 fonts using [@4bitlabs/sciotf](https://github.com/32bitkid/sci.js/tree/main/apps/sciotf).

## Supported Fonts

General overview of the glyphs that each version supports.

| Font                | Basic Latin | Latin-1 Supplement | Aspect Ratio |
|---------------------|:-----------:|:------------------:|:------------:|
| SciAC FONT.000      |     ✅      |         ✅         | 1&ratio;1.2  | 
| SciPX FONT.000      |     ✅      |         ✅         |  1&ratio;1   |
| SciAC FONT.000 Free |     ✅      |                    | 1&ratio;1.2  |
| SciPX FONT.000 Free |     ✅      |                    |  1&ratio;1   |

> [!note] 
> More FONT mappings/definitions will be coming soon for other Sierra SCI0/01 fonts.

### Aspect Ratio Correction

The EGA modes that these fonts were originally displayed on did not have square 1&ratio;1 aspect-ratio pixels, instead had
a display aspect-ratio of 1&ratio;1.2 (or the closest integer scaling of 5&ratio;6).

- `SciAC` prefixed fonts are "aspect-ratio correct"
- `SciPX` prefixed fonts are "square-pixel fonts"

## Compiling

Update FONT `.json` files to resolve all the *sources* required for that font. See the `README` files in 
the `./defs` folder for more details on what is required for each font. Once that is done, you can run the
following to generate an OTF file.

```bash
npx @4bitlabs/sciotf advanced defs/font.000.free.json --aspect-ratio 1:1.2 --chamfer inner
npx @4bitlabs/sciotf advanced defs/font.000.free.json --aspect-ratio 1:1 --chamfer none
npx @4bitlabs/sciotf advanced defs/font.000.json --aspect-ratio 1:1.2 --chamfer inner
npx @4bitlabs/sciotf advanced defs/font.000.json --aspect-ratio 1:1 --chamfer none
```
