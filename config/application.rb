require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module Piccies
  class Application < Rails::Application
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # Bower asset paths
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end

    # Precompile Bootstrap fonts
    config.assets.precompile << %r{bootstrap-sass-official/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff)$}

    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
