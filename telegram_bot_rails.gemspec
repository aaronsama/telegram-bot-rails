$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "telegram_bot_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "telegram_bot_rails"
  s.version     = TelegramBotRails::VERSION
  s.authors     = ["Aaron Ciaghi"]
  s.email       = ["aaron.ciaghi@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TelegramBotRails."
  s.description = "TODO: Description of TelegramBotRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "aasm", "~> 4.10.0"
  s.add_dependency "telegram-bot-ruby", "~> 0.5.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'pry'
end
