require_relative '../pages/BasePage'

class SimulcastPage < BasePage
  element :play_cta,      'button.p_button.p_cta.p_iplayerIcon'
  element :pause_button,  'button.p_button.p_controlBarButton.p_pauseButton'

  def playSimulcast
    within_frame(frame) do
      play_cta.click
    end
  end  
end
