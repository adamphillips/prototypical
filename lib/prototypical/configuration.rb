module Prototypical
  module Configuration
    attr_accessor :template_path, :enabled, :enable_on_include

    def enabled?
      !!enabled
    end

    def enable_on_include?
      !!enable_on_include
    end
  end
end