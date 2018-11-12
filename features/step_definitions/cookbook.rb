Given("I am on Cookbook") do
  visit '/'
  objcreate(BasePage).acceptCookie
end

Given("I visit Radio page") do
  visit '/audiouiod'
end

Given("I visit Simulcast page") do
  visit '/simulcast'
end

When("I click on Play CTA of Simulcast") do
  objcreate(SimulcastPage).playSimulcast
end

When("I click on Play CTA") do
  objcreate(AudioUiPage).playAudio
end

Then("I see the simulcast player starts playing") do
  expect(objcreate(SimulcastPage).checkElementPresent).to be true
end

Then("I see the audio starts playing") do
  expect(objcreate(AudioUiPage).checkElementPresent).to be true
end
