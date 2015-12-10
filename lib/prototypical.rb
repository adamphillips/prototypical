require 'active_support'

require 'prototypical/configuration'
require 'prototypical/controller'
require 'prototypical/railtie'

module Prototypical
  extend Configuration
end

ActiveSupport.run_load_hooks(:prototypical, Prototypical)
