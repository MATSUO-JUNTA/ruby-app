require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.generators do |g|
      g.assets false # CSS,Javascriptの生成を無効にする
      g.helper false # helperファイルの生成を無効にする
      g.test_framework :rspec,
        fixtures:false, # フィクスチャファイルの生成を無効にする
        view_spaces: false, # viewファイルの生成を無効にする
        helper_specs: false, # helperファイルの生成を無効にする
        routing_specs: false, # ルーティングファイルの生成を無効にする
        controller_specs: false, # コントローラーファイルの生成を無効にする
        request_specs: false # コントローラーファイルの生成を無効にする
    end
  end
end
