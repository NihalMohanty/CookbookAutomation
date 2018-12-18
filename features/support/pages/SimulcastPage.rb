require_relative '../pages/BasePage'

class SimulcastPage < BasePage
  element :play_cta,            'button.p_button.p_cta.p_iplayerIcon'
  element :pause_button,        'button.p_button.p_controlBarButton.p_pauseButton'
  element :volume_button,       'button.p_button.p_controlBarButton.p_volumeButton.audio'
  element :fullscreen_button,   'button.p_button.p_controlBarButton.p_fullscreenButton'
  element :seek_bar,            'div.p_bar.p_seekBar'
  element :seeker,              'div.p_playerSeekBarHolder > button.p_button.p_seekThumb'
  element :control_bar,         'div.p_playerControlBarHolder'
  element :subtitle_button,     'button.p_button.p_controlBarButton.p_subtitleButton.p_dontCloseSettingsPanel'
  # element :subtitle,   'div#subtitle_', match: :first
  element :subtitle_container, 'div#p_subtitleSettingsContainer'
  element :smallest_font_button,  'button#p_subtitleSizeButton_useSmallestFontSize'
  element :smallest_font_size,  'div#subtitle_ div.p_paragraph', match: :first

  def playSimulcast
    within_frame(frame) do
      play_cta.click
    end
  end

  def check_subtitle_on
    within_frame(frame) do
      subtitle_button.click
    end
  end

  def checkSubtitleSize
    p smallest_font_size["height"]
  end
end
