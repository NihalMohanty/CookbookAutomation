Given("I am on Cookbook") do
  visit '/'
  objcreate(BasePage).acceptCookie
end

Given("I visit Radio page") do
  visit '/audiouiod'
end

When("I click on Play CTA") do
  objcreate(AudioUiPage).playAudio
end

Then("I see the audio starts playing") do
  puts 'Hello It Worked! and I havent added assertions yet!'
end
