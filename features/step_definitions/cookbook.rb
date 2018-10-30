Given("I am on Cookbook") do
  p 'hello'
end

Given("I visit Radio page") do
  visit '/'
  sleep(4)
end

When("I click on Play CTA") do
  # within_frame('smphtml5iframemp') do
  #   find('button#p_audioui_playpause').click
  # end
  objcreate(BasePage).acceptCookie
  objcreate(AudioUiPage).playAudio
  sleep 4
end

Then("I see the audio starts playing") do
  puts 'Hello It Worked! and I havent added assertions yet!'
end
