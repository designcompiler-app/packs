# Design Compiler — Token Packs Registry

Public registry of curated [DTCG](https://www.w3.org/community/reports/design-tokens/CG-FINAL-format-20251028/) design token packs for the **Design Compiler** Figma plugin.

## What's here

| Path | Description |
|------|-------------|
| `catalog.json` | Index of all available packs (metadata only — no token data) |
| `packs/<id>.json` | Individual pack files containing full DTCG token data |

## Structure

### catalog.json

```jsonc
{
  "version": 1,
  "generatedAt": "2026-02-26T...",
  "packs": [
    {
      "id": "material-design-3",
      "name": "Material Design 3",
      "description": "Google's Material Design 3 color system...",
      "source": "Google",
      "version": "1.0.0",
      "license": "Apache-2.0",
      "categories": ["color-systems"],
      "preview": { "colors": ["#6750A4", ...] },
      "tokenCount": 42,
      "sizeBytes": 3200
    }
  ]
}
```

### Pack files

Each pack in `packs/<id>.json` follows this structure:

```jsonc
{
  "meta": {
    "id": "material-design-3",
    "name": "Material Design 3",
    "description": "...",
    "source": "Google",
    "version": "1.0.0",
    "license": "Apache-2.0",
    "categories": ["color-systems"],
    "preview": { "colors": [...] }
  },
  "data": {
    "primary": { "$type": "color", "$value": "#6750A4" }
  }
}
```

## How the plugin uses this

1. **Catalog fetch**: The plugin fetches `catalog.json` to display available packs in the browse UI
2. **On-demand fetch**: When a user selects a pack, the plugin fetches `packs/<id>.json`
3. **Caching**: Fetched packs are cached locally in Figma's `clientStorage` (LRU, 2MB budget)
4. **Starter packs**: ~8 essential packs are bundled with the plugin for offline use

## Mirrors

This registry is available on multiple platforms:

| Platform | URL |
|----------|-----|
| GitHub | `github.com/designcompiler-app/packs` |
| GitLab | `gitlab.com/design-compiler/packs` |
| Bitbucket | `bitbucket.org/designcompiler/packs` |
| Azure DevOps | `dev.azure.com/designcompiler/packs/_git/packs` |

GitHub is the primary; others are mirrors.

## Contributing

We welcome community pack contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Quick start

1. Fork this repo
2. Create a new pack file in `packs/` following the DTCG format
3. Update `catalog.json` with your pack's metadata
4. Submit a PR — CI will validate the DTCG format automatically

## License

MIT — see [LICENSE](LICENSE) for details.
