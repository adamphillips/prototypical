require 'rails'

module Prototypical
  class Railtie < Rails::Railtie
    config.prototypical = ActiveSupport::OrderedOptions.new

    config.prototypical.template_path = 'app/prototypes'
    config.prototypical.enabled = !Rails.env.production?
    config.prototypical.enable_on_include = false

    initializer "prototypical.set_configs" do |app|
      ActiveSupport.on_load(:prototypical) do
        app.config.prototypical.each do |k,v|
          send "#{k}=", v
        end
      end
    end

  end
end