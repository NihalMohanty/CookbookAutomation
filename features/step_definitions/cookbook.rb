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

Given("I visit a Random player page") do
  visit 'https://is.gd/ubebel'
end

Given("I visit Onward Journey page") do
  visit '/onwardjourney'
end

Given("I visit {int} player page") do |int|
  visit 'https://is.gd/fehase'
end

When("I click on Play CTA of Simulcast") do
  objcreate(SimulcastPage).playSimulcast
end

When("I click on Play CTA of {int} page") do |int|
  objcreate(Page360).play360
end

When("I click on Play CTA of Onwardjourney page") do
  objcreate(ContinuousPlay).playProgram
end

When("I click on Play CTA") do
  objcreate(RadioPage).playAudio
end

When("I click on Play CTA of a Random page") do
  objcreate(Player).playPlayer
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

When("I click the subtitle button") do
  sleep 8
  p 'clicked'
  objcreate(SimulcastPage).checkElementPresent
  objcreate(SimulcastPage).check_subtitle_on
end

When("I choose the minimum size out of size options") do
  within_frame(objcreate(SimulcastPage).frame) do
    objcreate(SimulcastPage).smallest_font_button.click
    sleep 4
  end
end

When("I open the autoplay option") do
  objcreate(ContinuousPlay).openSettings
  # objcreate(ContinuousPlay).autoPlayOff
  # objcreate(ContinuousPlay).seek_to_end_without_pause
end

When("I switch off the autoplay option") do
  objcreate(ContinuousPlay).autoPlayOff
end

When("I seek to the end of the player") do
  objcreate(ContinuousPlay).seek_to_end_without_pause
end

Then("After specified time the next program gets played") do
  within_frame(objcreate(ContinuousPlay).frame) do
    expect(objcreate(ContinuousPlay).pause_button.visible?).to be_truthy
  end
end

Then("I see {string} section") do |string|
  within_frame(objcreate(ContinuousPlay).frame) do
    expect(objcreate(ContinuousPlay).upnext.text).to eql "Up next in..."
  end
end

Then("I see one Up next and one More section") do
  within_frame(objcreate(ContinuousPlay).frame) do
    objcreate(ContinuousPlay).countdown.click
    expect(objcreate(ContinuousPlay).upnext.text).to eql "Up next"
    expect(objcreate(ContinuousPlay).more.text).to eql "More"
  end
end

Then("I am able to click and play one of the programs from the List") do
  objcreate(ContinuousPlay).checkCPList
  objcreate(ContinuousPlay).checkElementPresent
  within_frame(objcreate(ContinuousPlay).frame) do
    expect(objcreate(ContinuousPlay).pause_button.visible?).to be_truthy
  end
end

Then("I dont find any CP at the end of the video") do
  objcreate(ContinuousPlay).seek_to_end_without_pause
  # within_frame(objcreate(ContinuousPlay).frame) do
    expect(objcreate(ContinuousPlay).checkCountdown).to be_truthy
  # end
end

Then("I see the guidance message in the start") do
  expect(objcreate(Player).checkGuidance).to be true
end

Then("I see the Countdown appears after the CP plugin appears") do
  objcreate(ContinuousPlay).seek_to_end_without_pause
  expect(objcreate(ContinuousPlay).checkCountdown).to be_truthy
end

Then("I see the Continuous Play box at the end of the program") do
  sleep 4
  objcreate(ContinuousPlay).seek_to_end_without_pause
  within_frame(objcreate(ContinuousPlay).frame) do
    expect(objcreate(ContinuousPlay).cp_box.visible?).to be_truthy
  end
end

Then("I should see the size of subtitle change") do
  sleep 2
  within_frame(objcreate(SimulcastPage).frame) do
    expect(objcreate(SimulcastPage).subtitle.visible?).to be_truthy
    objcreate(SimulcastPage).checkSubtitleSize
    # expect((objcreate(SimulcastPage).smallest_font_size)['height']).to eq('11.3333px')
  end
end

Then("I should see the subtitles on the screen") do
  sleep 4
  within_frame(objcreate(SimulcastPage).frame) do
    expect(objcreate(SimulcastPage).subtitle_container.visible?).to be_truthy
  end
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

Then("I see the following elements to be present in the page for CP") do |table|
  sleep 5
  objcreate(ContinuousPlay).seek_to_end_without_pause
  table.hashes.each do |row|
    row.each do |key, value|
      expect(objcreate(ContinuousPlay).elementsPresent(value)).to be_truthy
    end
  end
end

Then("I see the following elements to present in the Simulcast page") do |table|
  sleep 5
  objcreate(SimulcastPage).checkElementPresent
  p 'clicked once '
  table.hashes.each do |row|
    row.each do |key, value|
      expect(objcreate(SimulcastPage).elementsPresent(value)).to be_truthy
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

Then("I see the player starts playing") do
  expect(objcreate(ContinuousPlay).checkElementPresent).to be true
end

Then("I see the program starts playing") do
  expect(objcreate(Player).checkElementPresent).to be true
end

Then("I see the {int} player starts playing") do |int|
  expect(objcreate(Page360).checkElementPresent360).to be true
end

Then("I see the +{int} number above the button") do |int|
  within_frame(objcreate(RadioPage).frame) do
  objcreate(RadioPage).forward_button.click_and_hold
  sleep 1
  p 'time to see the +20'

  expect(objcreate(RadioPage).forward20Icon).text?.to eql "+"

  objcreate(RadioPage).forward_button.action.click_and_hold.release
  end
end
