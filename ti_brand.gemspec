# frozen_string_literal: true

require_relative "lib/ti_brand/version"

Gem::Specification.new do |spec|
  spec.name        = "ti_brand"
  spec.version     = TiBrand::VERSION
  spec.authors     = ["Techimpossible Security Inc."]
  spec.email       = ["peter.skaronis@techimpossible.com"]

  spec.summary     = "Techimpossible design system as a Rails engine."
  spec.description  = "Canonical single source of truth for the Techimpossible " \
                      "brand: design tokens, self-hosted web fonts, and shared " \
                      "site CSS. Packaged as a Rails::Engine so host apps consume " \
                      "one copy of the fonts and stylesheets via the asset pipeline."
  spec.homepage    = "https://github.com/techimpossible/ti-brand"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir[
    "lib/**/*",
    "app/**/*",
    "README.md",
    "LICENSE.txt"
  ]
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 7.1"
end
