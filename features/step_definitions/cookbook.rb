Given("I am on Cookbook") do
  Capybara.default_driver = :selenium
  #  Selenium::WebDriver.for :chrome
  @browser = Capybara.current_session
end

Given("I visit Radio page") do
  @browser.visit 'http://cookbook.tools.bbc.co.uk/audiouiod'
  sleep(4)
end

When("I click on Play CTA") do
  @browser.find('div#cookiePrompt section button#bbcprivacy-continue-button').click
  @browser.find('div#cookiePrompt section button#bbccookies-continue-button').click
  within_frame('smphtml5iframemp') do
    @browser.find('button#p_audioui_playpause').click
  end
  sleep 4
end

Then("I see the audio starts playing") do
  puts 'Hello It Worked! and I havent added assertions yet!'
end
