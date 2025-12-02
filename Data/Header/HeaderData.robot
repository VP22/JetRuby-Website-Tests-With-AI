*** Variables ***
# Header Elements
${HEADER_ELEMENT}                    css:.elementor-element-a7a1c7e
${HEADER_LOGO}                       css:.elementor-icon
${CONTACT_BUTTON}                    css:.elementor-button
${NAVIGATION_MENU}                   css:.header-nav
${NAVIGATION_LINKS}                  css=.elementor-section--handles-inside .header-menu__item
${NAVIGATION_HREF_LINKS}             css=.header-menu__container > li.header-menu__item > a[href]
${NAVIGATION_TEXT_LINKS}             css=.header-menu__container > li.header-menu__item > a.header-link
${NAVIGATION_THE_LAST_ITEM}          css:li.header-menu__company
${SERVICES_LINK_MOBILE}              css:.header-menu__item:nth-child(2) > a
${MOBILE_MENU_ITEMS_SELECTOR}        css=.header-nav > .header-menu__wrapper > .header-menu__container > li.header-menu__item
${NAVIGATION_MENU_Technologies}      css:.elementor-section--handles-inside .header-menu__item:nth-child(1) > a
${NAVIGATION_MENU_Services}          css:.elementor-section--handles-inside .header-menu__item:nth-child(2) > a
${NAVIGATION_MENU_Solutions}         css:.elementor-section--handles-inside .header-menu__item:nth-child(3) > a
${NAVIGATION_MENU_Industries}        css:.elementor-section--handles-inside .header-menu__item:nth-child(4) > a
${NAVIGATION_MENU_Portfolio}         css:.elementor-section--handles-inside .header-menu__item:nth-child(5) > a
${NAVIGATION_MENU_Blog}              css:.elementor-section--handles-inside .header-menu__item:nth-child(6) > a
${NAVIGATION_MENU_News}              css:.elementor-section--handles-inside .header-menu__item:nth-child(7) > a
${NAVIGATION_MENU_Company}           css:.elementor-section--handles-inside .header-menu__item:nth-child(8) > a

# Navigation Items
@{NAVIGATION_ITEMS}                  Technologies    Services    Solutions    Industries    Portfolio    Blog    News    Company

# Test Data
${EXPECTED_LOAD_TIME_MS}             500
${SCROLL_PIXELS}                     200
${DESKTOP_WIDTH}                     1280
${MOBILE_WIDTH}                      375

# Attributes
${ALT_ATTRIBUTE}                     alt
${HREF_ATTRIBUTE}                    href
${ROLE_ATTRIBUTE}                    role
${ARIA_LABEL}                        aria-label
${ARIA_LABELLEDBY}                   aria-labelledby
${ARIA_EXPANDED}                     aria-expanded

# Error Messages
${EMPTY_ALT_ERROR}                   Logo should have a non-empty alt attribute