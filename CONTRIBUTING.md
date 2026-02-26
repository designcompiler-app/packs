# Contributing to Design Compiler Packs

Thanks for your interest in contributing design token packs! This guide will help you create and submit a pack.

## Pack requirements

1. **DTCG format**: All tokens must use the [W3C Design Tokens](https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/) format with `$type` and `$value` keys
2. **Valid JSON**: Pack files must be valid JSON
3. **Required metadata**: Each pack must include `meta.id`, `meta.name`, `meta.description`, `meta.source`, `meta.version`, `meta.license`, and `meta.categories`
4. **Unique ID**: The pack `id` must be unique and match the filename (`packs/<id>.json`)
5. **License**: You must have the right to distribute the tokens under the declared license

## Creating a new pack

### 1. Create the pack file

Create `packs/your-pack-id.json`:

```json
{
  "meta": {
    "id": "your-pack-id",
    "name": "Your Pack Name",
    "description": "A brief description of what this pack contains",
    "source": "Your Name or Organization",
    "version": "1.0.0",
    "license": "MIT",
    "categories": ["color-systems"],
    "preview": {
      "colors": ["#FF0000", "#00FF00", "#0000FF"]
    }
  },
  "data": {
    "primary": {
      "$type": "color",
      "$value": "#FF0000"
    },
    "secondary": {
      "$type": "color",
      "$value": "#00FF00"
    }
  }
}
```

### 2. Choose categories

Available categories:
- `color-systems` — Complete color palettes and systems
- `typography` — Font stacks, scales, and text styles
- `spacing` — Spacing scales and layout tokens
- `shadows` — Elevation and shadow tokens
- `borders` — Border styles, widths, and radii
- `motion` — Animation and transition tokens
- `brand` — Brand-specific token sets
- `accessibility` — WCAG-compliant token sets
- `frameworks` — Framework-specific tokens (Material, Fluent, etc.)

### 3. Update the catalog

Add your pack's metadata to `catalog.json` in the `packs` array:

```json
{
  "id": "your-pack-id",
  "name": "Your Pack Name",
  "description": "A brief description",
  "source": "Your Name",
  "version": "1.0.0",
  "license": "MIT",
  "categories": ["color-systems"],
  "preview": { "colors": ["#FF0000", "#00FF00", "#0000FF"] },
  "tokenCount": 2,
  "sizeBytes": 350
}
```

**Calculating values:**
- `tokenCount`: Number of tokens with `$value` keys in `data`
- `sizeBytes`: File size of `packs/your-pack-id.json` in bytes

### 4. Submit a PR

1. Fork this repository
2. Create a branch: `git checkout -b add-your-pack-id`
3. Add your files and commit
4. Push and open a Pull Request
5. CI will validate your pack's DTCG format automatically

## Updating an existing pack

1. Bump the `version` in both the pack file and `catalog.json`
2. Update `tokenCount` and `sizeBytes` in `catalog.json` if changed
3. Submit a PR with a clear description of what changed

## Review criteria

PRs are reviewed for:
- ✅ Valid DTCG format
- ✅ Correct metadata (id matches filename, required fields present)
- ✅ Catalog consistency (pack appears in catalog with correct stats)
- ✅ License compliance (you have rights to distribute)
- ✅ Quality (tokens are meaningful and well-organized)

## Questions?

Open an issue if you have questions about contributing.
