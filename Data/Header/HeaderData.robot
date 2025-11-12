*** Variables ***
# Header Elements
${HEADER_ELEMENT}                    css:.elementor-element-a7a1c7e
${HEADER_LOGO}                       css:.elementor-icon
${CONTACT_BUTTON}                    css:.elementor-button
${NAVIGATION_MENU}                   css:.header-nav
${NAVIGATION_LINKS}                  css:.elementor-section--handles-inside .header-menu__item
${NAVIGATION_HREF_LINKS}             css:.elementor-section--handles-inside .header-menu__item > a[href]
${MOBILE_MENU_TOGGLE}                css:.header-burger-icon
${MOBILE_MENU}                       css:.header-menu__wrapper
${SERVICES_LINK_MOBILE}              css:.header-menu__item:nth-child(2) > a

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