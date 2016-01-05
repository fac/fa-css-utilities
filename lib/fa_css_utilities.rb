require "fa_css_utilities/version"

module FaCssUtilities
  class << self
    # Inspired by Kaminari
    def load!

      if sprockets?
        register_sprockets
      end

      configure_sass
    end

    # Paths
    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def stylesheets_path
      assets_path
    end

    def assets_path
      @assets_path ||= gem_path
    end

    # Environment detection helpers
    def sprockets?
      defined?(::Sprockets)
    end

    private

    def configure_sass
      require 'sass'

      ::Sass.load_paths << stylesheets_path

      # bootstrap requires minimum precision of 8, see https://github.com/twbs/bootstrap-sass/issues/409
      ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max
    end

    def register_sprockets
      Sprockets.append_path(stylesheets_path)
    end
  end
end

FaCssUtilities.load!
