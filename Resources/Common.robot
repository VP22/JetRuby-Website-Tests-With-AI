*** Settings ***
Library           SeleniumLibrary
Resource          ../Data/CommonData.robot

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

# Close All Browsers
#     Close All Browsers

Navigate To Page
    [Arguments]    ${page_url}
    Go To    ${page_url}

Set Viewport Size
    [Arguments]    ${width}    ${height}=800
    Set Window Size    ${width}    ${height}

I am on the homepage
    Go To    ${HOMEPAGE_URL}

the page is opened
    Go To    ${HOMEPAGE_URL}

I navigate to "${page_name}" page
    Run Keyword If    '${page_name}' == 'Services'
    ...    Go To    ${SERVICES_PAGE_URL}
    ...    ELSE
    ...    Fail    Page '${page_name}' is not defined

the viewport is set to desktop-sized
    Set Window Size    ${DESKTOP_WIDTH}    800

the viewport is set to mobile-sized
    Set Window Size    ${MOBILE_WIDTH}    800

the OS is set to dark mode
    # This would typically involve setting browser preferences or using a specific test environment
    # Placeholder for actual implementation
    No Operation