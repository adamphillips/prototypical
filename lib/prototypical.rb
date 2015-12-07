require 'active_support'

require 'prototypical/railtie'

module Prototypical
  class << self
    attr_accessor :view_path
  end
end

ActiveSupport.run_load_hooks(:prototypical, Prototypical)
