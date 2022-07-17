require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kiseleff
  class Application < Rails::Application
    config.load_defaults 5.2

    # Keep belongs_to fields optional by default, because that's the way
    # Rails 4 models worked
    config.active_record.belongs_to_required_by_default = false

    # Use local forms with `form_with`, so it works like `form_for`
    config.action_view.form_with_generates_remote_forms = false

    # Keep using AES-256-CBC for message encryption in case it's used
    # in any CONSUL installations
    config.active_support.use_authenticated_message_encryption = false

    # Handle custom exceptions
    config.action_dispatch.rescue_responses["FeatureFlags::FeatureDisabled"] = :forbidden

    # Store files locally.
    config.active_storage.service = :local

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    available_locales = ["en", "fr", "ro"]
    config.i18n.available_locales = ["en", "fr", "ro"]
    config.i18n.fallbacks = { "fr" => "en" }

    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**[^custom]*", "*.{rb,yml}")]
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "custom", "**", "*.{rb,yml}")]

    config.after_initialize do
      Globalize.set_fallbacks_to_all_available_locales
    end

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")

    # Add lib to the autoload path
    config.autoload_paths << Rails.root.join("lib")
    config.time_zone = "Bucharest"
    config.active_job.queue_adapter = :delayed_job
  end
end
