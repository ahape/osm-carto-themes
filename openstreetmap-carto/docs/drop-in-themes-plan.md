# Drop-in Themes for openstreetmap-carto

## Objective
Enable a "drop-in" theme system for rendering cartography maps in `kosmtik`. The end goal is to support applying completely distinct color palettes, such as "Solarized Dark" or "Obsidian", to the `openstreetmap-carto` map without modifying the core styling logic.

## Background & Motivation
The `openstreetmap-carto` project is designed as a single, general-purpose style map. Colors are scattered across the project: some are defined as `@variables` at the top of individual `.mss` files, some are generated dynamically by Python scripts (`scripts/generate_road_colours.py`), and many are hardcoded hex values (e.g., `#787878`, `#ffffff`) embedded deep within the CartoCSS styling rules.

To support true "drop-in" themes, CartoCSS variables must be fully leveraged to abstract colors away from the structural styling rules. Furthermore, the map renderer (`kosmtik`) must provide a mechanism to inject an overriding theme file dynamically during compilation.

## Proposed Solution

Based on the selected approaches:

1. **Centralize in Default Theme (CartoCSS Refactoring)**:
   - Create a centralized `style/themes/default.mss` file in `openstreetmap-carto`.
   - All existing color `@variables` scattered across files (`water.mss`, `roads.mss`, `style.mss`, etc.) will be moved to this single file.
   - All hardcoded color values across all `.mss` files will be abstracted into new, semantic `@variables` defined in `default.mss`.
   - `project.mml` will be updated to include `style/themes/default.mss` as the very first stylesheet, establishing the base palette.
   - Alternate themes (e.g., `style/themes/solarized-dark.mss`) will simply be `.mss` files that redefine these variables.

2. **Modify Kosmtik Loader (Theme Injection)**:
   - Modify `kosmtik` to accept a new command-line argument: `--theme <theme-name>`.
   - Intercept the project loading process in `kosmtik/src/back/Project.js` (`loader.load()`).
   - If a `--theme` is provided, dynamically append the corresponding theme `.mss` file (e.g., `style/themes/<theme-name>.mss`) to the *end* of the `this.mml.Stylesheet` array before it is passed to the `carto` compiler.
   - Because CartoCSS evaluates variables globally with "last definition wins" semantics, appending the theme file last will seamlessly override the base variables defined in `default.mss`.

## Phased Implementation Plan

### Phase 1: Documentation
1. **Save Plan**: Once implementation begins, copy this plan to `docs/drop-in-themes-plan.md` in the `openstreetmap-carto` repository so that this work can be referenced and continued at a later date.

### Phase 2: Kosmtik Modifications
1. **Update Config**: Modify `kosmtik/src/back/Config.js` (or related CLI parser) to accept a `--theme` string argument.
2. **Update Project Loader**: Modify `kosmtik/src/back/Project.js` to inspect the loaded `this.mml` object. If `this.config.parsed_opts.theme` is set, locate the theme `.mss` file (resolving paths relative to the project root) and append it to `this.mml.Stylesheet`.
3. **Testing**: Add or update `kosmtik` tests to verify that the injected stylesheet is correctly passed to the Carto renderer.

### Phase 3: Centralize Existing Variables
1. **Create Base Theme**: Create `style/themes/default.mss` in `openstreetmap-carto`.
2. **Extract**: Move all existing `@color` variables from `style.mss`, `water.mss`, `roads.mss`, `tourism.mss`, `amenity-points.mss`, etc., into `default.mss`.
3. **MML Update**: Prepend `style/themes/default.mss` to the `Stylesheet` array in `project.mml`.

### Phase 4: Abstract Hardcoded Colors
1. **Audit**: Systematically search the `style/*.mss` files for hardcoded hex colors (`#XXX`, `#XXXXXX`) and RGB/HSL functions.
2. **Refactor**: Replace these hardcoded values with semantic variables (e.g., `@tunnel-fill`, `@building-border-dark`) and add their default definitions to `style/themes/default.mss`.

### Phase 5: Handle Generated Road Colors
1. **Refactor Scripts**: Update `road-colors.yaml` and `scripts/generate_road_colours.py`.
2. **Variable Output**: Instead of outputting rigid CartoCSS rules directly into `road-colors-generated.mss`, modify the script to output the generated colors as overridable `@variables` into a dedicated file (e.g., `style/road-colors-variables.mss`), or ensure the generated rules strictly rely on variables defined in the base theme.

### Phase 6: Create Validation Theme
1. **Solarized Dark**: Create `style/themes/solarized-dark.mss`.
2. **Override**: Redefine key background, water, road, and landcover variables to use a Solarized Dark color palette.
3. **Validation**: Run `kosmtik serve project.mml --theme solarized-dark` and visually verify that the map renders with the new theme correctly, without styling errors.

## Verification & Testing
- **Visual Regression**: Run kosmtik without the `--theme` flag to ensure the default rendering perfectly matches the existing `openstreetmap-carto` output (no visual regressions from extracting variables).
- **Theme Override Verification**: Ensure that running with `--theme solarized-dark` successfully changes the colors across *all* map features (land, water, roads, text) proving that no hardcoded colors remain.

## Migration & Rollback
- The changes to `openstreetmap-carto` are purely variable extractions; structural rules remain the same. If visual regressions occur, we can simply revert the commits replacing hardcoded colors in specific `.mss` files.
- The `kosmtik` changes are additive. If the `--theme` flag is omitted, `kosmtik` behaves exactly as it did before.