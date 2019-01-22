class BasePage < SitePrism::Page

  element :cookieOkPrompt , 'div#cookiePrompt section button#bbcprivacy-continue-button'
  element :cookieContinue , 'div#cookiePrompt section button#bbccookies-continue-button'
  element :stageEnvlink,    'section.settings div.settings-environment label input#environment-stage[type="radio"]'
  element :frame,           '#smphtml5iframemp'
  element :player,          'div#smphtml5iframempwrp'
  element :backward_button,  'button#p_audioui_backInterval'
  element :forward_button,   'button#p_audioui_forwardInterval'
  element :fullScreen_button, 'button.p_button.p_controlBarButton.p_fullscreenButton'
  element :int_option,       'section.settings div.settings-environment input#environment-int'
  element :test_option,      'section.settings div.settings-environment input#environment-test'
  element :stage_option,     'section.settings div.settings-environment input#environment-stage'
  element :live_option,      'section.settings div.settings-environment input#environment-live'

  def acceptCookie
    cookieOkPrompt.click
    cookieContinue.click
  end

  def goFullScreen
    within_frame(frame) do
      fullScreen_button.click
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

  def elementsPresent(value)
    within_frame(frame) do
      element = value.tr(' ', '_')
      send(element).visible?
    end
  end
end
