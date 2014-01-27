require File.expand_path('../boot', __FILE__)

require 'rails/all'
Bundler.require(:default, Rails.env)

module HomeOwner
  class Application < Rails::Application
    config.assets.enabled = true
    config.assets.js_compressor = :uglifier
    config.assets.css_compressor = :sass
    config.action_controller.page_cache_directory = "#{Rails.root.to_s}/public/deploy"
  end
end
