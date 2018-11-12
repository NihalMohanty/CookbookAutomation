require_relative '../pages/BasePage'

class AudioUiPage < BasePage
  element :play_cta, 'button#p_audioui_playpause'
  element :pause_button, 'button#p_audioui_playpause'

  def playAudio
    within_frame(frame) do
      play_cta.click
    end
  end
end
