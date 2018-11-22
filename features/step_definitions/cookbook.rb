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
  objcreate(RadioPage).playAudio
end

When("I am at the start of the player") do
  objcreate(RadioPage).playAudio
  sleep 4
  objcreate(RadioPage).pauseAudio
  objcreate(RadioPage).moveBackward
end

When("I am at the end of the player") do
  objcreate(RadioPage).playAudio
  sleep 4
  objcreate(RadioPage).seek_to_end
end

When("I pause the audio") do
  objcreate(RadioPage).playAudio
  sleep 6
  objcreate(RadioPage).pauseAudio
  sleep 2
end

When("I click the forward {int} button") do |int|
  objcreate(RadioPage).moveForward
end

When("I click the backward {int} button") do |int|
  objcreate(RadioPage).moveForward
  objcreate(RadioPage).moveBackward
end

When("I play the full program") do
  sleep 4
  objcreate(RadioPage).seek_to_end_without_pause
end

Then("I should be able to replay that.") do
  sleep 2
  objcreate(RadioPage).playAudio
  sleep 3
  expect(objcreate(RadioPage).elementsPresent("pause button")).to be true
end

Then("I see the following elements to be present in the page") do |table|
  sleep 3
  table.hashes.each do |row|
    row.each do |key, value|
      expect(objcreate(RadioPage).elementsPresent(value)).to be_truthy
    end
  end
end

Then("I see the time moved {int} seconds ahead or to the end of the player") do |int|
  expect(objcreate(RadioPage).moveBy20).to be_between(17, 21).exclusive
end

Then("I see the time moved {int} seconds behind or to the start") do |int|
  expect(objcreate(RadioPage).moveBy20).to be_between(14, 21).exclusive
end

Then("the +{int} button is disabled") do |int|
  within_frame(objcreate(RadioPage).frame) do
    expect(objcreate(RadioPage).forward_button.disabled?).to be true
  end
end

Then("the {int} button is disabled") do |int|
  within_frame(objcreate(RadioPage).frame) do
    expect(objcreate(RadioPage).backward_button.disabled?).to be true
  end
end

Then("I see the simulcast player starts playing") do
  expect(objcreate(SimulcastPage).checkElementPresent).to be true
end

Then("I see the audio starts playing") do
  expect(objcreate(RadioPage).checkElementPresent).to be true
end

# Then("I see the +{int} number above the button") do |int|
#   expect(objcreate(RadioPage).forward20Icon).text?.to eql "+"
# end
