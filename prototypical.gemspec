$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prototypical/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prototypical"
  s.version     = Prototypical::VERSION
  s.authors     = ["Adam Phillips"]
  s.email       = ["adam@29ways.co.uk"]
  s.homepage    = "https://github.com/adamphillips/prototypical"
  s.summary     = "Easy prototyping in Rails applications."
  s.description = "Adds simple prototyping to Rails application via a secondary template folder."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4"

  s.add_development_dependency "minitest-spec-rails", "~> 5.3"
  s.add_development_dependency "mocha", "~> 1.1"
  s.add_development_dependency "pry-byebug", "~> 3.3"
end
