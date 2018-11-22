require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'
require 'yaml'

Capybara.default_driver = :selenium
Capybara.app_host = "http://cookbook.tools.bbc.co.uk"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

Capybara.default_max_wait_time = 5

# Capybara.configure do |config|
#   config.default_max_wait_time = 7
# end

World(Capybara::DSL)
