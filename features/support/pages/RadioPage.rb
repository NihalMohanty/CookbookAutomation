require_relative '../pages/BasePage'

class RadioPage < BasePage
  element :play_cta,        'button#p_audioui_playpause'
  element :pause_button,    'button#p_audioui_playpause'
  element :volume_button,   'button.p_button.p_controlBarButton.p_volumeButton.audio'
  element :seeker,          'div.p_playerSeekBarHolder > button.p_button.p_seekThumb'
  element :leftTimeSlot,    'div#p_audioui_leftTimeDisplay'
  element :rightTimeSlot,   'div#p_audioui_rightTimeDisplay'
  element :timeTip,         'div.p_timeTip > span.p_timeTipText'
  element :forward20Icon,   'div.p_audioui_intervalNumber span.p_audioui_intervalNumber_sign'

  def playAudio
    within_frame(frame) do
      play_cta.click
    end
  end

  def pauseAudio
    within_frame(frame) do
      pause_button.click
    end
  end

  def moveBackward
    within_frame(frame) do
      backward_button.click
    end
  end

  def moveForward
    within_frame(frame) do
      sleep 3
      forward_button.click
      p 'clicked once'
    end
  end

  def moveBy20
    within_frame(frame) do
      sleep 4
      seeker.click
      startTime = timeTip.text.tr(':','')
      p startTime
      forward_button.click
      sleep 5
      seeker.click
      endTime = timeTip.text.tr(':','')
      p endTime
      p endTime.to_i - startTime.to_i
      if startTime != endTime
        (endTime.to_i - startTime.to_i)
      end
    end
  end

  def moveBy20backward
    within_frame(frame) do
      sleep 4
      seeker.click
      startTime = timeTip.text.tr(':','')
      p startTime
      sleep 5
      seeker.click
      endTime = timeTip.text.tr(':','')
      p endTime
      p endTime.to_i - startTime.to_i
      if startTime != endTime
        (endTime.to_i - startTime.to_i)
      end
    end

  end

  def seek_to_end
    within_frame(frame) do
      pause_button.click
      endTime = rightTimeSlot.text
      seeker.click
      seeker.native.send_keys(:arrow_right) until timeTip.text == endTime
      end
    end

    def seek_to_end_without_pause
      within_frame(frame) do
        # pause_button.click
        endTime = rightTimeSlot.text
        seeker.click
        seeker.native.send_keys(:arrow_right) until timeTip.text == endTime
        end
    end

    def elementsPresent(value)
      within_frame(frame) do
        element = value.tr(' ', '_')
        send(element).visible?
      end
    end
  end
