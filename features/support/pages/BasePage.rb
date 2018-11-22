class BasePage < SitePrism::Page

  element :cookieOkPrompt , 'div#cookiePrompt section button#bbcprivacy-continue-button'
  element :cookieContinue , 'div#cookiePrompt section button#bbccookies-continue-button'
  element :stageEnvlink,    'section.settings div.settings-environment label input#environment-stage[type="radio"]'
  element :frame,           '#smphtml5iframemp'
  element :player,          'div#smphtml5iframempwrp'
  element :backward_button,  'button#p_audioui_backInterval'
  element :forward_button,   'button#p_audioui_forwardInterval'

  def acceptCookie
    cookieOkPrompt.click
    cookieContinue.click
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
