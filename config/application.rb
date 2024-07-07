require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CustomerPointService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_controller.forgery_protection_origin_check = false
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # 許可するオリジンを指定します（ワイルドカード * を使用してすべてのオリジンを許可することもできます）
        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: false # クッキーや認証情報を含むリクエストを許可する場合
      end
    end
  end
end
