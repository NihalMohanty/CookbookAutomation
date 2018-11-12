require_relative '../pages/BasePage'

class SimulcastPage < BasePage
  element :play_cta,      'button.p_button.p_cta.p_iplayerIcon'
  element :pause_button,  'button.p_button.p_controlBarButton.p_pauseButton'
  element :player,        'div#smphtml5iframempwrp'

  def playSimulcast
    within_frame(frame) do
      play_cta.click
    end
  end

  def checkElementPresent
    player.hover
    within_frame(frame) do
      if(pause_button.visible? == true)
        true
      end
    end
  end

end
