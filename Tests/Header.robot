*** Settings ***
Documentation     Feature: Website Header Validation
...               Tests for validating website header components and behaviors
Resource          ../Resources/Header/HeaderKeywords.robot
Resource          ../Resources/Common.robot
Resource          ../Data/CommonData.robot
Suite Setup        Open Browser To Homepage
Suite Teardown     Close All Browsers

*** Test Cases ***

# Structure and Content Tests
Header Element Is Present In The DOM
    [Tags]    visibility    
    Given I am on the homepage
    When the page source is checked
    Then the <header> element should exist in the page source

Header Is Visible On Page Load
    [Tags]    visibility
    Given the page is opened
    When the page is checked for the header
    Then the main header should be visible

Logo Is Present In The Header
    [Tags]    logo
    Given I am on the homepage
    When the header content is checked
    Then the logo image should be present

Logo Is Clickable And Links To Homepage
    [Tags]    logo
    Given I am on the homepage
    When I click the logo
    Then I should be navigated to the homepage

# Header Logo Contains SVG Image
#     [Documentation]    Verify that the header logo contains an SVG image.
#     [Tags]    logo    structure
#     Given I am on the homepage
#     When the logo element is examined
#     Then the logo should contain an SVG image

All Expected Navigation Items Are Present
    [Tags]    navigation  
    Given I am on the homepage
    When the navigation section is checked
    Then the following navigation links should be present
    ...    Technologies
    ...    Services
    ...    Solutions
    ...    Industries
    ...    Portfolio
    ...    Blog
    ...    News
    ...    Company

# Dropdown Menus Are Hidden By Default
#     [Tags]    navigation    dropdown
#     Given I am on the homepage
#     When the page is loaded
#     Then all dropdown menus should be hidden

# Dropdown Menus Appear On Hover
#     [Tags]    navigation    dropdown    hover
#     Given the viewport is set to desktop-sized
#     When I hover over the "Technologies" navigation item
#     Then the technologies dropdown menu should be visible

# Technologies Dropdown Contains Correct Items
#     [Tags]    navigation    dropdown
#     Given I am on the homepage
#     When I hover over the "Technologies" navigation item
#     Then the technologies dropdown should contain sub-items
#         ...    Ruby on Rails
#         ...    Node JS
#         ...    Kotlin
#         ...    Spree Commerce
#         ...    AWS
#         ...    Swift
#         ...    React JS
#         ...    Kubernetes
#         ...    React Native

# Services Dropdown Contains Correct Sections
#     [Tags]    navigation    dropdown
#     Given I am on the homepage
#     When I hover over the "Services" navigation item
#     Then the services dropdown should contain sections
#         ...    Software development
#         ...    Project management

Navigation Links Are Visible On Desktop Viewport
    [Tags]    navigation    
    Given the viewport width is  ${DESKTOP_WIDTH}
    When the navigation items are displayed
    Then all primary navigation items should be visible

# Header Contains Required CSS Classes
#     [Documentation]    Verify that the header element contains the required CSS classes.
#     [Tags]    structure
#     Given I am on the homepage
#     When the header element is examined
#     Then the header should contain required CSS classes
#         ...    elementor
#         ...    elementor-location-header
#         ...    elementor-sticky
#         ...    header-main
#         ...    header-fixed
#         ...    header-desktop
#         ...    header-mobile
#         ...    header-nav
#         ...    header-menu
#         ...    header-menu__item

# Mobile-specific Tests
Mobile Menu Toggle Is Hidden On Desktop
    [Tags]    mobile    
    Given the viewport width is  ${DESKTOP_WIDTH}
    When the header is checked for mobile menu
    Then the mobile menu toggle should not be visible

# Mobile Menu Items Have Icons
#     [Tags]    mobile
#     Given the viewport width is  ${MOBILE_WIDTH}
#     When I open the mobile menu
#     Then each mobile menu item should have an icon

# Mobile Menu Closes When Clicking Outside
#     [Tags]    mobile
#     Given the viewport width is  ${MOBILE_WIDTH}
#     And the mobile menu is open
#     When I click outside the mobile menu
#     Then the mobile menu should close

# Mobile Menu Supports Nested Navigation
#     [Tags]    mobile
#     Given the viewport width is  ${MOBILE_WIDTH}
#     When I open the mobile menu
#     And I click on the "Technologies" parent item
#     Then the technologies submenu should be displayed

Each Navigation Link Has A Valid Href
    [Tags]    navigation    Review
    [Documentation]    Verify that each navigation link contains a non-empty href attribute. Links are checked twice!
    Given I am on the homepage
    When the navigation links are examined
    Then every navigation link should have a non-empty href attribute

Navigation Links Are Keyboard-focusable
    [Tags]    navigation
    Given I am on the homepage
    When I press Tab key repeatedly from page start
    Then I should be able to focus each navigation link in order

Contact Button Is Present In The Header
    [Tags]    contact-button    
    Given I am on the homepage
    When the header is checked for contact button
    Then the "Contact" button should be present

Contact Button Is Styled As A Call-to-action
    [Tags]    contact-button
    Given I am on the homepage
    When the contact button is examined
    Then the "Contact" button should have a distinct visual style (e.g., background color)

Contact Button Is Clickable
    [Tags]    contact-button
    Given I am on the homepage
    When I click the "Contact" button
    Then I should be taken to the contact page or modal

Contact Button Has Appropriate ARIA Label Or Role
    [Tags]    contact-button
    Given I am on the homepage
    When the contact button attributes are checked
    Then the "Contact" button should have a valid role or aria-label

Mobile Menu Toggle Is Visible On Mobile Viewport
    [Tags]    mobile    
    Given the viewport width is  ${MOBILE_WIDTH}
    When the header is checked for mobile menu
    Then the mobile menu toggle should be visible

Mobile Menu Is Hidden By Default On Mobile
    [Tags]    mobile  
    Given the viewport width is  ${MOBILE_WIDTH}
    When the page is loaded
    Then the mobile navigation menu should be hidden

Clicking Mobile Toggle Opens The Menu
    [Tags]    mobile
    Given the viewport width is  ${MOBILE_WIDTH}
    When I click the mobile menu toggle
    Then the mobile navigation menu should be visible

Mobile Menu Contains All Navigation Items
    [Tags]    mobile    
    Given the viewport width is  ${MOBILE_WIDTH}
    When I open the mobile menu
    Then the mobile menu should contain all 8 navigation items

Clicking On The Close Button In Mobile Menu Closes The Menu
    [Tags]    mobile    
    Given the viewport width is  ${MOBILE_WIDTH}
    And the mobile menu is open
    When I click the Close button in mobile menu
    Then the mobile menu should close

# Accessibility Tests

Logo Has Appropriate Alt Text For Accessibility
    [Tags]    logo    
    Given I am on the homepage
    When the logo element is examined
    Then the logo should have non-empty alt attribute

Header Has Proper Landmark Role
    [Tags]    accessibility
    Given I am on the homepage
    When the header element is examined
    Then the <header> element should have role="banner" or be a native <header>

Navigation Region Is Properly Labeled
    [Tags]    accessibility
    Given I am on the homepage
    When the navigation element is checked
    Then the main <nav> element should have an aria-label or aria-labelledby

Header Loads Within 500ms Of Page Load
    [Tags]    performance
    Given the page is opened
    When the loading time is measured
    Then the header should be fully rendered within 500 milliseconds

No Layout Shift Occurs During Header Rendering
    [Tags]    visual
    Given the page is opened
    When the header is rendered
    Then the header should not cause cumulative layout shift (CLS)

Header Does Not Contain Inline Scripts Or Eval()
    [Tags]    security
    Given I am on the homepage
    When the header source is examined
    Then the header HTML should not include inline JavaScript or dangerous eval patterns

Logo Links To Root With Rel=home Or Equivalent Semantic Practice
    [Tags]    seo    
    Given I am on the homepage
    When the logo link is checked
    Then the logo link should point to "/" and support SEO best practices

Navigation Links Show Visual Feedback On Hover
    [Tags]    hover-states
    Given the viewport is set to desktop-sized
    When I hover over the "Portfolio" link
    Then it should display a hover effect (e.g., color change, underline)

All Interactive Elements Show Visible Focus Indicator
    [Tags]    focus-states
    Given I am on the homepage
    When I tab to the "Contact" button
    Then it should display a clear focus ring or outline

Header Remains Fixed Or Behaves As Designed On Scroll
    [Tags]    scrolling
    Given I am on the homepage
    When I scroll down 200 pixels
    Then the header should maintain its expected scroll behavior (fixed/sticky/collapsible)

Header Renders Correctly Even If One Asset Fails To Load
    [Tags]    error-resilience
    Given the logo image fails to load
    When the header is rendered
    Then the header layout should not break

Entire Header Is Navigable Via Keyboard Only
    [Tags]    keyboard-navigation
    Given I am on the homepage
    When I use only Tab and Enter keys
    Then I should be able to access all interactive header elements

Header Appears Appropriately In Print Preview
    [Tags]    print
    Given I am on the homepage
    When I open print preview
    Then the header should be visible and legible

Header Adapts To System Dark Mode
    [Tags]    dark-mode
    Given the OS is set to dark mode
    When the page is loaded
    Then the header should use appropriate dark-mode colors

# Performance and Analytics Tests
Clicks On Header Links Trigger Expected Tracking Events
    [Tags]    analytics
    Given I am on the homepage
    When I click the "Blog" link
    Then a tracking event should be sent (e.g., via dataLayer or analytics API)

# Header Assets Load Without Errors
#     [Tags]    performance
#     Given I am on the homepage
#     When the header assets are checked
#     Then all images should load successfully
#     And all scripts should execute without errors

# Header Does Not Block Rendering
#     [Tags]    performance
#     Given the page is opened
#     When the loading process is monitored
#     Then the header should not block page rendering

# # Responsive Tests
# Header Adapts Correctly To Various Viewport Widths
#     [Tags]    responsive
#     Given I am on the homepage
#     When the viewport width is  ${DESKTOP_WIDTH}
#     Then the header should display correctly in desktop view

#     Given I am on the homepage
#     When the viewport width is  ${MOBILE_WIDTH}
#     Then the header should display correctly in mobile view

# Header Adapts To Tablet Viewports
#     [Tags]    responsive
#     Given the viewport width is  768
#     When the header is checked
#     Then the header should adapt to tablet layout

# Header Elements Reorder Responsively
#     [Tags]    responsive
#     Given the viewport width is  ${MOBILE_WIDTH}
#     When the header layout is examined
#     Then menu items should be stacked vertically
#     And contact button should be hidden

# Security Tests

# Header Does Not Expose Sensitive Information
#     [Tags]    security
#     Given I am on the homepage
#     When the header source is examined
#     Then the header HTML should not contain sensitive data (e.g., API keys, tokens)

# Header Links Use HTTPS Protocol
#     [Tags]    security
#     Given I am on the homepage
#     When header links are checked
#     Then all external links should use HTTPS