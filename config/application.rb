require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # config.time_zone = 'Central Time (US & Canada)'

    config.i18n.default_locale = :ja
    config.i18n.available_locales = %i(ja en)
    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.template_engine :slim
      g.test_framework :rspec, view_specs: false, fixture: true
      # g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
