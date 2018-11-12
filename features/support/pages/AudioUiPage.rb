require_relative '../pages/BasePage'

class AudioUiPage < BasePage
  # set_url('http://cookbook.tools.bbc.co.uk/audiouiod')

  element :play_cta, 'button#p_audioui_playpause'
  element :pause_button, 'button#p_audioui_playpause'

  def playAudio
    within_frame(frame) do
      play_cta.click
    end
  end

  def checkElementPresent
    within_frame(frame) do
      if(pause_button.visible? == true)
        true
      end
    end
  end
end
