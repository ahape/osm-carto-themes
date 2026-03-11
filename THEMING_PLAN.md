# Drop-in Theme Plan for `openstreetmap-carto`

## What I Found

**Color variable distribution (~2,686 total `@variable` usages across 19 files):**

| File | Variables defined | What they cover |
|---|---|---|
| `style/style.mss` | `@water-color`, `@land-color`, halo | Map background, water |
| `style/landcover.mss` | ~60 variables | Grass, forest, buildings, transport, etc. |
| `style/roads.mss` | ~30 variables | Road fills, casings, access markings |
| `style/road-colors-generated.mss` | 20 variables | Motorway/trunk/primary/secondary (machine-generated) |
| `style/buildings.mss` | 7 variables | Building fill/line |
| `style/water.mss` | 3 variables | Water text, glacier |
| `style/admin.mss` | 3 variables | Admin boundary colors |
| `style/placenames.mss` | 5 variables | Label/text colors |
| `style/amenity-points.mss` | ~20 variables | POI icons, text |
| `style/water-features.mss` | 6 variables | Dams, weirs |

**Critical insight — LESS lazy evaluation:** CartoCSS is LESS-based, and LESS uses lazy variable
evaluation — the **last definition of any variable wins** across the entire compiled document. This
means a theme file loaded *last* in the stylesheet list will override earlier definitions, AND derived
variables like `@building-line: darken(@building-fill, 15%)` will automatically pick up the new base
values. **This is the core mechanism that makes theming work with minimal refactoring.**

**Kosmtik hook:** The `local-config` plugin (`kosmtik/src/plugins/local-config/`) can patch
`project.mml` at load time via a `localconfig.js` in the project root — including appending entries
to the `Stylesheet` array.

---

## The Plan

### Phase 1 — Create a central `style/palette.mss`

Extract all **primitive** (non-derived) color variable declarations from individual `.mss` files into
a new `style/palette.mss`. This file becomes the canonical color definition for the default theme.

The individual `.mss` files keep their **derived** variables (e.g., `darken(@building-fill, 15%)`)
since those auto-update via LESS lazy eval.

`palette.mss` would look like:

```css
/* --- Core map --- */
@land-color: #f2efe9;
@water-color: #aad3df;

/* --- Vegetation --- */
@grass: #cdebb0;
@forest: #add19e;
@park: #c8facc;
/* ... ~130 more variables ... */
```

Update `project.mml` to list `style/palette.mss` **first** in the `Stylesheet` array. This ensures
theme overrides loaded later win.

### Phase 2 — Theme directory structure

```
themes/
  default/
    palette.mss          ← symlink or copy of style/palette.mss (reference impl)
  solarized-dark/
    palette.mss          ← overrides for all ~130 color variables
    road-colors.yaml     ← optional: theme-specific road color generation params
    road-colors.mss      ← optional: pre-generated road colors for this theme
  obsidian/
    palette.mss
    road-colors.mss
```

A theme's `palette.mss` only needs to define the variables it wants to override. Everything else
falls back to the default palette because LESS resolves the last-defined value.

### Phase 3 — Road color theming (special case)

`road-colors-generated.mss` is **machine-generated** from `road-colors.yaml` via
`scripts/generate_road_colours.py`. Road colors use LCH color math (hue ranges, lightness, chroma)
— they aren't simple hex overrides.

Two options per theme:
- **Option A (simple):** Include a pre-generated `road-colors.mss` in the theme folder.
- **Option B (parametric):** Include a `road-colors.yaml` with adjusted hue/lightness/chroma values;
  a build step runs the generator.

The theme application script (Phase 4) handles whichever is present.

### Phase 4 — `scripts/apply-theme.py`

A new Python script that:
1. Takes a `--theme <name>` argument
2. If the theme has `road-colors.yaml`, runs `generate_road_colours.py` with it and writes
   `style/road-colors-generated.mss`
3. If the theme has `road-colors.mss`, copies it to `style/road-colors-generated.mss`
4. Writes/updates `openstreetmap-carto/localconfig.js` to inject the theme's `palette.mss` at the
   **end** of the stylesheet list

### Phase 5 — Kosmtik `localconfig.js`

A `localconfig.js` in `openstreetmap-carto/` that appends the active theme's palette file:

```js
exports.LocalConfig = function(config, project) {
  const theme = process.env.OSM_THEME || 'default';
  const themePalette = `../themes/${theme}/palette.mss`;
  config.where('Stylesheet').last().after({path: themePalette});
};
```

Kosmtik picks this up automatically at startup. Switching themes becomes:

```sh
OSM_THEME=solarized-dark node index.js serve ../openstreetmap-carto/project.mml
```

### Phase 6 — Implement two sample themes

**Solarized Dark** — semantic color mapping:
- `@land-color` → Solarized `base03` (#002b36)
- `@water-color` → dark blue (#0a374a)
- `@grass`, `@forest`, etc. → darkened/desaturated greens
- `@placenames` → Solarized `base0` (#839496)
- Road fill → lighter tones of Solarized accent colors

**Obsidian** — high-contrast dark:
- Near-black land, dark water, muted vegetation
- High-contrast white/light-grey labels

---

## What Doesn't Need to Change

- All `.mss` files keep their **structure and rules** — no rule changes needed
- `project.mml` gets one addition (`palette.mss` as first stylesheet)
- The Kosmtik `local-config` plugin is used as-is

---

## Risks / Open Questions

1. **LESS lazy eval in CartoCSS** — needs a quick validation test. If it doesn't work correctly, the
   fallback is to do full variable substitution at build time (the script rewrites variable values
   directly in `.mss` files, with `git stash` to revert).

2. **Hardcoded inline colors** — `admin.mss` uses `white` hardcoded in background rules (for the
   border overlap trick). These won't be themeable via variables alone without adding new variables.

3. **SVG symbols** — the `symbols/` and `patterns/` directories contain SVG files with hardcoded
   fill colors. Dark themes may need SVG variants or a preprocessing step to recolor them.

4. **Road color math** — Solarized Dark road colors need careful LCH math to look coherent; can't
   just shift hues arbitrarily.

---

## Suggested Implementation Order

1. Validate LESS lazy eval behavior (small test with two conflicting variable definitions)
2. Create `style/palette.mss` + update `project.mml`
3. Build `scripts/apply-theme.py` + `localconfig.js`
4. Implement Solarized Dark palette
5. Validate rendering in Kosmtik
6. Implement Obsidian palette
7. Address SVG symbols / hardcoded colors if needed
