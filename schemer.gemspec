$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "schemer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "schemer"
  s.version     = Schemer::VERSION
  s.authors     = ["Pranav Dhar"]
  s.email       = ["pranav.dhar2@gmail.com"]
  s.homepage    = "https://github.com/pdhar/schemer"
  s.summary     = "A rails gem that lets you create multiple choice questions and an interface to analyze the responses."
  s.description = "A rails gem that lets you create multiple choice questions and an interface to analyze the responses."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "cocoon"
  s.add_dependency "protected_attributes"
  s.add_dependency "jquery-rails"
  s.add_dependency "active_model_serializers"

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'

end
