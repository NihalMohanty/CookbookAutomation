require_relative '../pages/BasePage'

class Page360 < BasePage
  element :play_cta,      'button.p_button.p_cta.p_iplayerIcon'
  element :pause_button,  'button.p_button.p_controlBarButton.p_pauseButton'

  def play360
    within_frame(frame) do
      play_cta.click
      sleep 4
    end
  end

  def checkElementPresent360
    player.click
    within_frame(frame) do
      if(pause_button.visible? == true)
        true
      end
    end
  end
end
