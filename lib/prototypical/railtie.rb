require 'rails'

module Prototypical
  class Railtie < Rails::Railtie
    config.prototypical = ActiveSupport::OrderedOptions.new

    config.prototypical.view_path = 'app/prototypes'
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