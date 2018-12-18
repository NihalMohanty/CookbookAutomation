require_relative '../pages/BasePage'

class ContinuousPlay < BasePage
  element :settings_button, 'button.p_button.p_controlBarButton.p_playbackSettingsButton.p_dontCloseSettingsPanel'
  element :play_cta,        'button.p_button.p_cta'
  element :volume_button,   'button.p_button.p_controlBarButton.p_volumeButton.audio'
  element :pause_button,    'button.p_button.p_controlBarButton.p_pauseButton'
  element :leftTimeSlot,    'div.p_timeDisplay span.p_time', match: :first
  element :rightTimeSlot,   'div.p_timeDisplay span.p_time.p_duration'
  element :timeTip,         'div.p_timeTip > span.p_timeTipText'
  element :seeker,          'div.p_playerSeekBarHolder > button.p_button.p_seekThumb'
  element :cp_box,          'div.gcp_inpageCountdownItem'
  element :countdown,       'div.gcp_inpageCountdownItem div.gcp_spinnerCountdown'
  element :autoplayOption,  'div#p_autoplayToggle'
  element :upnext,          'div.gcp_inpageCountdownItem div.gcp_inpageCountdownHeader span.gcp_countdownText'
  element :more,            'div.gcp_carouselBackground p.gcp_moreContentTitle'

  elements :carousal_elements, 'li.gcp_carouselItem div.gcp_item div.gcp_itemWrap div.gcp_itemCta svg.gcp_itemCtaIcon'

  def openSettings
    player.hover
    within_frame(frame) do
      settings_button.click
    end
  end

  def playProgram
    within_frame(frame) do
      play_cta.click
    end
  end

  def checkCPList
    within_frame(frame) do
      countdown.click
      sleep 3
      for i in 0..carousal_elements.size
        if (i == 2)
          carousal_elements[i].click
        end
      end
      play_cta.click
    end
    # checkElementPresent
  end

  def autoPlayOff
    within_frame(frame) do
      autoplayOption.click
    end
  end

  def checkCountdown
    within_frame(frame) do
      if (countdown.visible?)
        true
      # else true
      end
      # countdown.visible?
      # if (countdown.focusable? == false)
      #   true
      # end
    end
  end

  def seek_to_end_without_pause
    sleep 4
    player.click
    within_frame(frame) do
      # pause_button.click
      endTime = rightTimeSlot.text
      seeker.click
      seeker.native.send_keys(:arrow_right) until timeTip.text == endTime
      end
  end
end
