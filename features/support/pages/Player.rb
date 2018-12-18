require_relative '../pages/BasePage'

class Player < BasePage
  element :play_cta,            'button.p_button.p_cta'
  element :pause_button,        'button.p_button.p_controlBarButton.p_pauseButton'
  element :guidance_msg,        'div.p_ctaGuidance.p_guidance'

  def playPlayer
    within_frame(frame) do
      play_cta.click
    end
  end

  def checkGuidance
    within_frame(frame) do
      guidance_msg.visible?
    end
  end
end
