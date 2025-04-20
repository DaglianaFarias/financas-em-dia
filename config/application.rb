require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module GestaoFinanceira
  class Application < Rails::Application
    config.load_defaults 7.0

    config.i18n.default_locale = :'pt-BR'
    config.autoload_paths << Rails.root.join("lib")
    config.active_job.queue_adapter = :sidekiq
  end
end
