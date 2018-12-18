require 'capybara/dsl'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'
require 'yaml'
# require 'touch_action'

Capybara.default_driver = :selenium
Capybara.app_host = "http://cookbook.tools.bbc.co.uk"
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome
end

Capybara.default_max_wait_time = 15
Capybara.current_session.driver.browser.manage.window.maximize

World(Capybara::DSL)
