$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prototypical/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prototypical"
  s.version     = Prototypical::VERSION
  s.authors     = ["Adam Phillips"]
  s.email       = ["aphillips@scholastic.co.uk"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Prototypical."
  s.description = "TODO: Description of Prototypical."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
end
