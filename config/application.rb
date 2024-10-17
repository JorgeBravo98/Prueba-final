require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Savnac
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuración personalizada para manejar errores de rutas no encontradas
    config.exceptions_app = self.routes

    # El resto de la configuración
  end
end
