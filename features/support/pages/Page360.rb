require_relative '../pages/BasePage'

class Page360 < BasePage
  element :play_cta,      'button.p_button.p_cta.p_iplayerIcon'
  element :pause_button,  'button.p_button.p_controlBarButton.p_pauseButton'
  element :volume_button,     'button.p_button.p_controlBarButton.p_volumeButton.audio'
  element :seeker,            'div.p_playerSeekBarHolder > button.p_button.p_seekThumb'
  element :settings_button,   'button.p_button.p_controlBarButton.p_playbackSettingsButton.p_dontCloseSettingsPanel'
  element :touch_up,          'div#p_compassContainer rect#p_compass_up_touch'
  element :touch_right,       'div#p_compassContainer rect#p_compass_right_touch'
  element :touch_down,        'div#p_compassContainer rect#p_compass_down_touch'
  element :touch_left,        'div#p_compassContainer rect#p_compass_left_touch'
  element :touch_center,      'div#p_compassContainer rect#p_compass_centre_touch'
  element :fullScreen_button, 'button.p_button.p_controlBarButton.p_fullscreenButton'

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

  def elementsPresent360(value)
    sleep 3
    player.click
    within_frame(frame) do
      element = value.tr(' ', '_')
      send(element).visible?
    end
  end

  def dragPlayer
    page.driver.browser.action.move_to(player.native, 240, 250).
                             click_and_hold.
                             move_to(player.native, 240, 800).
                             release.
                             perform
  end
end
