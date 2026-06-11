# ti_brand

The Techimpossible Security Inc. design system, packaged as a Rails engine.

This gem is the **single source of truth** for the Techimpossible brand: design
tokens, self-hosted web fonts, and shared site CSS. Host applications (the
marketing site and the clients portal) consume one canonical copy through the
Rails asset pipeline instead of each duplicating fonts and stylesheets.

## What's inside

- **Fonts** — `app/assets/fonts/*.woff2` (Inter Tight, Schibsted Grotesk,
  Fraunces, Instrument Serif, JetBrains Mono — variable where available).
- **Stylesheets** — `app/assets/stylesheets/ti_brand/`:
  - `ti_brand/tokens.css` — brand colors + semantic design tokens.
  - `ti_brand/fonts.css` — `@font-face` declarations and font-stack variables.
  - `ti_brand/site.css` — shared site primitives, components, page styles.

The stylesheets are namespaced under a `ti_brand/` subdirectory so their logical
asset names (`ti_brand/tokens`, etc.) can never collide with a host app's own
`tokens.css` / `fonts.css` / `site.css`.

## Installation

Add to your `Gemfile`:

```ruby
gem "ti_brand", git: "https://github.com/techimpossible/ti-brand.git"
```

Then:

```bash
bundle install
```

`TiBrand::Engine` is a `Rails::Engine`, so it automatically appends its
`app/assets` paths to the host app's asset load path. No initializer or manual
path configuration is required.

## Usage

Load the stylesheets in your layout, in cascade order
(tokens → fonts → site):

```erb
<%= stylesheet_link_tag "ti_brand/tokens", "ti_brand/fonts", "ti_brand/site",
      "data-turbo-track": "reload" %>
```

Preload fonts by their bare filename — Propshaft resolves them against the
engine's font directory:

```erb
<% %w[fraunces-2.woff2 inter-tight-6.woff2 jetbrains-mono-5.woff2 schibsted-grotesk-1.woff2].each do |font| %>
  <link rel="preload" href="<%= asset_path(font) %>" as="font" type="font/woff2" crossorigin>
<% end %>
```

### A note on font references

`ti_brand/fonts.css` references fonts by bare filename, e.g.
`src: url(inter-tight-6.woff2)`. Propshaft resolves font filenames against the
whole asset load path (independent of where the CSS file itself lives), so these
references resolve correctly even though the CSS is namespaced under
`ti_brand/` and the fonts live at `app/assets/fonts/`.

## License

MIT.
