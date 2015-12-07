require 'rails'

module Prototypical
  class Railtie < Rails::Railtie
    config.prototypical = ActiveSupport::OrderedOptions.new

    config.prototypical.view_path = 'app/prototypes'

    initializer "prototypical.set_configs" do |app|
      ActiveSupport.on_load(:prototypical) do
        app.config.prototypical.each do |k,v|
          send "#{k}=", v
        end
      end
    end

  end
end