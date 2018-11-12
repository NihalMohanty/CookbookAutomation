class BasePage < SitePrism::Page

  element :cookieOkPrompt , 'div#cookiePrompt section button#bbcprivacy-continue-button'
  element :cookieContinue , 'div#cookiePrompt section button#bbccookies-continue-button'
  element :frame, '#smphtml5iframemp'

  def acceptCookie
    cookieOkPrompt.click
    cookieContinue.click
  end
end
