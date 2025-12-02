*** Variables ***
${BROWSER}                      chrome
${HOMEPAGE_URL}                 https://jetruby.com/
${SERVICES_PAGE_URL}            http://localhost:8080/services
${TIMEOUT}                      10
${DESKTOP_WIDTH}                1280
${MOBILE_WIDTH}                 375
${COOKIE_NOTIFICATION}          id=cookie_notification
${COOKIE_CLOSE_BUTTON}          css=#cookie_notification > span
${MOBILE_MENU}                  css:.header-menu__wrapper
${MOBILE_MENU_TOGGLE}           css=.elementor-section--handles-inside .header-burger-icon:not(.opened)
${MOBILE_MENU_TOGGLE_CLOSE}     css=.elementor-section--handles-inside .header-burger-icon.opened
${CHAT_WIDGET}                  css=.WidgetWrapper__Wrapper-dNgyVS
${CHAT_WIDGET_CLOSE_BUTTON}     css=[data-test-id="ai-welcome-msg-close-button"]