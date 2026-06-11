# frozen_string_literal: true

module TiBrand
  # Mounting this as a Rails::Engine automatically appends the engine's
  # app/assets/* directories to the host application's asset load path.
  # That makes the namespaced stylesheets (ti_brand/tokens, ti_brand/fonts,
  # ti_brand/site) and the woff2 font files resolvable from the host app
  # via stylesheet_link_tag / asset_path, with no per-app configuration.
  class Engine < ::Rails::Engine
  end
end
