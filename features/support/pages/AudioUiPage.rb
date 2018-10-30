require 'C:\Users\m1041925\atom_workspace\CookbookAutomation\features\support\pages\BasePage.rb'

class AudioUiPage < BasePage
  set_url('http://cookbook.tools.bbc.co.uk/audiouiod')

  element :play_cta, 'button#p_audioui_playpause'
  element :audio_frame, '#smphtml5iframemp'
  def playAudio
    within_frame(audio_frame) do
      play_cta.click
    end
  end
end
