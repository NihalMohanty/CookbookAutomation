require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'

Capybara.default_driver = :selenium
Capybara.app_host = "http://cookbook.tools.bbc.co.uk"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

World(Capybara::DSL)
