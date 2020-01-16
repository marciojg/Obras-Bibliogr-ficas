# -*- encoding : utf-8 -*-
require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ObrasApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.encoding = "UTF-8"
    config.time_zone = 'Brasilia'
    config.i18n.locale = 'pt-BR'
    config.i18n.default_locale = 'pt-BR'
    config.action_controller.include_all_helpers = false
    config.active_record.time_zone_aware_types = %i[datetime time]
    config.autoload_paths << Rails.root.join('app')
    config.api_only = true
  end
end
