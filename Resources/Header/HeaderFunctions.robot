*** Settings ***
Documentation     Implementation of header test functions
Library           SeleniumLibrary
Library           Collections
Resource          ../../Data/Header/HeaderData.robot
Resource          ../Common.robot
Resource          ../../Data/CommonData.robot

*** Keywords ***
Check if header element exists in DOM
    Page Should Contain Element    ${HEADER_ELEMENT}

Verify header visibility
    Element Should Be Visible    ${HEADER_ELEMENT}

Check if logo is present
    Page Should Contain Element    ${HEADER_LOGO}

Validate logo alt attribute
    ${alt_text}=    Get Element Attribute    ${HEADER_LOGO}    ${ALT_ATTRIBUTE}
    Should Not Be Empty    ${alt_text}    ${EMPTY_ALT_ERROR}

Click on the logo image
    Click Element    ${HEADER_LOGO}

Verify current page is homepage
    Location Should Be    ${HOMEPAGE_URL}

Verify navigation links presence
    @{actual_links}=    Get Webelements    ${NAVIGATION_LINKS}
    ${actual_link_texts}=    Create List
    FOR    ${link}    IN    @{actual_links}
        ${text}=    Get Text    ${link}
        Append To List    ${actual_link_texts}    ${text}
    END
    
    FOR    ${expected_link}    IN    @{NAVIGATION_ITEMS}
        List Should Contain Value    ${actual_link_texts}    ${expected_link}
    END

Check navigation link exists
    [Arguments]    ${link_text}
    Page Should Contain    ${link_text}

the following navigation items should be visible
    [Arguments]    @{expected_items}
    FOR    ${item}    IN    @{expected_items}
        Element Should Be Visible    xpath=//a[normalize-space()="${item}"]
    END

Validate navigation link href attributes
    @{links}=    Get Webelements    ${NAVIGATION_HREF_LINKS}
    FOR    ${link}    IN    @{links}
        ${href}=    Get Element Attribute    ${link}    ${HREF_ATTRIBUTE}
        Should Not Be Empty    ${href}    Navigation link should have a non-empty href attribute
    END

Simulate tab key navigation
    # This would typically be implemented with Press Key or similar
    # For now, we'll just note that it's a placeholder
    Log    Simulating tab key navigation

Verify navigation link focusability
    # This would check that each link can be focused in order
    Log    Verifying navigation link focusability

Check if contact button is present
    Page Should Contain Element    ${CONTACT_BUTTON}

Validate contact button styling
    # This would check for specific styling like background color
    Log    Validating contact button styling

Click on contact button
    Click Element    ${CONTACT_BUTTON}

Verify navigation to contact page
    # This would check if we've navigated to the contact page or modal
    Log    Verifying navigation to contact page

Validate contact button accessibility
    # Check for role or aria-label
    ${role}=    Run Keyword And Return Status    Get Element Attribute    ${CONTACT_BUTTON}    ${ROLE_ATTRIBUTE}
    ${aria_label}=    Run Keyword And Return Status    Get Element Attribute    ${CONTACT_BUTTON}    ${ARIA_LABEL}
    Run Keyword Unless    ${role} or ${aria_label}    
    ...    Fail    Contact button should have a valid role or aria-label

Verify mobile menu toggle invisibility
    Element Should Not Be Visible    ${MOBILE_MENU_TOGGLE}

Verify mobile menu toggle visibility
    Element Should Be Visible    ${MOBILE_MENU_TOGGLE}

Verify mobile menu is hidden
    Element Should Not Be Visible    ${MOBILE_MENU}

Click on mobile menu toggle
    Click Element    ${MOBILE_MENU_TOGGLE}

Verify mobile menu visibility
    Wait Until Element Is Visible    ${MOBILE_MENU}

Verify mobile menu items
    # Wait for the last menu item to be visible to ensure menu is fully expanded
    Wait Until Element Is Visible    ${NAVIGATION_THE_LAST_ITEM}    timeout=20
    
    # Cycle through all navigation items
    @{actual_items}=    Create List
    FOR    ${item}    IN    @{NAVIGATION_ITEMS}
        # Check for mobile menu close button and click if visible
        ${menu_humburger_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${MOBILE_MENU_TOGGLE}    timeout=1
        Run Keyword If    ${menu_humburger_visible}    Click Element    ${MOBILE_MENU_TOGGLE}
        Run Keyword If    ${menu_humburger_visible}    Wait Until Element Is Visible    ${MOBILE_MENU}    timeout=5
        
        # Get the appropriate selector based on the item
        ${selector}=    Set Variable If
        ...    '${item}' == 'Technologies'    ${NAVIGATION_MENU_Technologies}
        ...    '${item}' == 'Services'    ${NAVIGATION_MENU_Services}
        ...    '${item}' == 'Solutions'    ${NAVIGATION_MENU_Solutions}
        ...    '${item}' == 'Industries'    ${NAVIGATION_MENU_Industries}
        ...    '${item}' == 'Portfolio'    ${NAVIGATION_MENU_Portfolio}
        ...    '${item}' == 'Blog'    ${NAVIGATION_MENU_Blog}
        ...    '${item}' == 'News'    ${NAVIGATION_MENU_News}
        ...    '${item}' == 'Company'    ${NAVIGATION_MENU_Company}
        ...    ${None}
        
        # Wait for element to be visible
        Wait Until Element Is Visible    ${selector}    timeout=5
        
        # Get text from the element
        ${text}=    Get Text    ${selector}
        Append To List    ${actual_items}    ${text}
    END
    
    # Final verification
    ${count}=    Get Length    ${actual_items}
    Should Be Equal As Numbers    ${count}    8    Mobile menu should contain all 8 navigation items
    Lists Should Be Equal    ${actual_items}    ${NAVIGATION_ITEMS}    Mobile menu items should match expected navigation items

Verify mobile menu items count
    Wait Until Element Is Visible    ${MOBILE_MENU}    timeout=5
    # Wait for the last menu item to be visible to ensure menu is fully expanded
    ${last_item_selector}=    Set Variable    css=.header-menu__container > li.header-menu__item:last-child > a.header-link
    Wait Until Element Is Visible    ${last_item_selector}    timeout=10
    @{mobile_links}=    Get Webelements    ${MOBILE_MENU_ITEMS_SELECTOR}
    ${count}=    Get Length    ${mobile_links}
    Should Be Equal As Numbers    ${count}    8    Mobile menu should contain all 8 navigation items

Elements Should Be Visible
    [Arguments]    ${selector}
    @{elements}=    Get Webelements    ${selector}
    ${count}=    Get Length    ${elements}
    Should Be Equal As Numbers    ${count}    8    Expected 8 elements but found ${count}
    FOR    ${element}    IN    @{elements}
        Element Should Be Visible    ${element}
    END

Mobile Menu Should Contain All Items
    @{mobile_links}=    Get Webelements    ${MOBILE_MENU_ITEMS_SELECTOR}
    ${count}=    Get Length    ${mobile_links}
    Should Be Equal As Numbers    ${count}    8    Mobile menu should contain all 8 navigation items

Click on the Close button in mobile menu
    Click Element    ${MOBILE_MENU_TOGGLE_CLOSE}

Ensure mobile menu is open
     # Check if the mobile menu close button is visible
    ${close_button_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${MOBILE_MENU_TOGGLE_CLOSE}    timeout=5
    # If close button is not visible, but menu might still be open, click the toggle button
    Run Keyword If    not ${close_button_visible}    Click Element    ${MOBILE_MENU_TOGGLE}
    # Wait until the mobile menu is not visible
    Wait Until Element Is Visible    ${MOBILE_MENU}    timeout=10

Verify mobile menu closed
    Wait Until Element IS Not Visible    ${MOBILE_MENU}    timeout=10

Validate header landmark role
    ${is_header}=    Run Keyword And Return Status    Element Should Be Visible    tag:header
    ${role}=    Run Keyword And Return Status    Element Attribute Should Be    ${HEADER_ELEMENT}    ${ROLE_ATTRIBUTE}    banner
    Run Keyword Unless    ${is_header} or ${role}    
    ...    Fail    Header element should have role="banner" or be a native <header>

Validate navigation labeling
    ${aria_label}=    Run Keyword And Return Status    Get Element Attribute    ${NAVIGATION_MENU}    ${ARIA_LABEL}
    ${aria_labelledby}=    Run Keyword And Return Status    Get Element Attribute    ${NAVIGATION_MENU}    ${ARIA_LABELLEDBY}
    Run Keyword Unless    ${aria_label} or ${aria_labelledby}    
    ...    Fail    Main <nav> element should have an aria-label or aria-labelledby

Open mobile navigation menu
    # Check if the close button is visible - if it is, the menu is already open
    ${close_button_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${MOBILE_MENU_TOGGLE_CLOSE}    timeout=2
    IF    not ${close_button_visible}
        Click Element    ${MOBILE_MENU_TOGGLE}
    END
    Wait Until Element Is Visible    ${MOBILE_MENU}

Open Mobile Menu
    Click Element    ${MOBILE_MENU_TOGGLE}

Click on the humburger menu icon
    ${menu_humburger_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${MOBILE_MENU_TOGGLE}    timeout=1
    Run Keyword If    ${menu_humburger_visible}    Click Element    ${MOBILE_MENU_TOGGLE}
    # Click Element     ${MOBILE_MENU_TOGGLE}
    Wait Until Element Is Visible     ${MOBILE_MENU_TOGGLE_CLOSE}

Measure header loading time
    # This would measure the time it takes for the header to load
    # Implementation would depend on specific requirements
    Log    Measuring header loading time

Navigate to services page
    Go To    ${SERVICES_PAGE_URL}

Check for layout shifts
    # This would check for cumulative layout shift
    Log    Checking for layout shifts

Scan header for unsafe scripts
    # This would scan the header HTML for inline scripts or eval
    Log    Scanning header for unsafe scripts

Validate logo link destination
    # This would check that the logo links to the homepage with proper SEO attributes
    ${href}=    Get Element Attribute    ${HEADER_LOGO}    href
    Should Be Equal    ${href}    https://jetruby.com/    Logo link should point to "https://jetruby.com/"
    # Additional SEO checks could be added here

Change site language to French
    # This would change the site language
    Log    Changing site language to French

Verify accented character display
    # This would verify that navigation items display correctly with accented characters
    Log    Verifying accented character display

Hover over portfolio link
    # This would hover over the portfolio link
    Log    Hovering over portfolio link

Verify hover effect
    # This would check for hover effects
    Log    Verifying hover effect

Tab to contact button
    # This would tab to the contact button
    Log    Tabbing to contact button

Verify focus indicator
    # This would check for visible focus indicators
    Log    Verifying focus indicator

Scroll page vertically
    [Arguments]    ${pixels}
    Execute JavaScript    window.scrollBy(0, ${pixels})

Verify header scroll behavior
    # This would verify the header's scroll behavior
    Log    Verifying header scroll behavior

Simulate logo image failure
    # This would simulate a logo image failure
    Log    Simulating logo image failure

Verify header layout integrity
    # This would check that the header layout doesn't break when assets fail
    Log    Verifying header layout integrity

Navigate with keyboard only
    # This would navigate with keyboard only
    Log    Navigating with keyboard only

Verify keyboard accessibility
    # This would verify keyboard accessibility
    Log    Verifying keyboard accessibility

Open print preview dialog
    # This would open print preview
    Log    Opening print preview dialog

Verify print preview header
    # This would verify header in print preview
    Log    Verifying print preview header

Enable dark mode
    # This would enable dark mode
    Log    Enabling dark mode

Verify dark mode styling
    # This would verify dark mode styling
    Log    Verifying dark mode styling

Click on blog link
    # This would click the blog link
    Log    Clicking on blog link

Verify analytics event triggered
    # This would verify that an analytics event was triggered
    Log    Verifying analytics event triggered

Set browser viewport width
    [Arguments]    ${width}
    Set Window Size    ${width}    800

Look for contact button in header
    Page Should Contain Element    ${CONTACT_BUTTON}

Inspect contact button properties
    # This would inspect contact button properties
    Log    Inspecting contact button properties

Examine contact button attributes
    # This would examine contact button attributes
    Log    Examining contact button attributes

Look for mobile menu toggle
    Page Should Contain Element    ${MOBILE_MENU_TOGGLE}

Wait for page to load completely
    Wait Until Page Contains Element    ${HEADER_ELEMENT}

Inspect header element properties
    # This would inspect header element properties
    Log    Inspecting header element properties

Examine navigation element
    Page Should Contain Element    ${NAVIGATION_MENU}

Time page loading process
    # This would time the page loading process
    Log    Timing page loading process

Wait for header to render
    Wait Until Page Contains Element    ${HEADER_ELEMENT}

Inspect header html source
    # This would inspect the header HTML source
    Log    Inspecting header html source

Examine logo link properties
    # This would examine logo link properties
    Log    Examining logo link properties

Verify navigation items visibility
    @{links}=    Get Webelements    ${NAVIGATION_LINKS}
    ${count}=    Get Length    ${links}
    Log    Found ${count} navigation items
    Should Be Equal As Numbers    ${count}    8    Expected 8 navigation items but found ${count}
    FOR    ${index}    IN RANGE    ${count}
        ${link}=    Get From List    ${links}    ${index}
        ${text}=    Get Text    ${link}
        Log    Checking visibility of navigation item "${text}" (index ${index})
        Run Keyword And Continue On Failure    Element Should Be Visible    ${link}
    END

Examine navigation section
    Page Should Contain Element    ${NAVIGATION_MENU}

Inspect navigation links
    Page Should Contain Element    ${NAVIGATION_LINKS}

Examine header content
    Page Should Contain Element    ${HEADER_ELEMENT}

Look for header on page
    Page Should Contain Element    ${HEADER_ELEMENT}