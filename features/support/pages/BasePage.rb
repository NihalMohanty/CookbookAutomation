class BasePage < SitePrism::Page

  element :cookieOkPrompt , 'div#cookiePrompt section button#bbcprivacy-continue-button'
  element :cookieContinue , 'div#cookiePrompt section button#bbccookies-continue-button'

  def acceptCookie
    cookieOkPrompt.click
    cookieContinue.click
  end

end
# World(BasePage)
