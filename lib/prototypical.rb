require 'active_support'

require 'prototypical/railtie'

module Prototypical
  class << self
    attr_accessor :view_path, :enabled, :enable_on_include

    def enabled?
      !!enabled
    end

    def enable_on_include?
      !!enable_on_include
    end
  end
end

ActiveSupport.run_load_hooks(:prototypical, Prototypical)
