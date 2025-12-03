*** Settings ***
Resource          ../Common.robot
Resource          ../../Data/CommonData.robot
Resource          HeaderFunctions.robot

*** Keywords ***
the page source is checked
    Check if header element exists in DOM

the <header> element should exist in the page source
    Check if header element exists in DOM

the main header should be visible
    Verify header visibility

the logo image should be present
    Check if logo is present

the logo element is examined
    Validate logo alt attribute
the logo should have non-empty alt attribute
    Validate logo alt attribute

I click the logo
    Click on the logo image

I should be navigated to the homepage
    Verify current page is homepage

the following navigation links should be present
    [Arguments]    @{expected_links}
    Verify navigation links presence

all primary navigation items should be visible
    Verify navigation items visibility

every navigation link should have a non-empty href attribute
    Validate navigation link href attributes

I press Tab key repeatedly from page start
    Simulate tab key navigation

I should be able to focus each navigation link in order
    Verify navigation link focusability

the "Contact" button should be present
    Check if contact button is present

the "Contact" button should have a distinct visual style (e.g., background color)
    Validate contact button styling

I click the "Contact" button
    Click on contact button

I should be taken to the contact page or modal
    Verify navigation to contact page

the "Contact" button should have a valid role or aria-label
    Validate contact button accessibility

the mobile menu toggle should not be visible
    Verify mobile menu toggle invisibility

the mobile menu toggle should be visible
    Verify mobile menu toggle visibility

the mobile navigation menu should be hidden
    Verify mobile menu is hidden

I click the mobile menu toggle
    Click on mobile menu toggle

the mobile navigation menu should be visible
    Verify mobile menu visibility

the mobile menu should contain all 8 navigation items
    Verify mobile menu items

I click the Close button in mobile menu
    Click on the Close button in mobile menu

the mobile menu is open
    Ensure mobile menu is open

the mobile menu should close
    Verify mobile menu closed

the <header> element should have role="banner" or be a native <header>
    Validate header landmark role

the main <nav> element should have an aria-label or aria-labelledby
    Validate navigation labeling

the mobile menu toggle should have aria-expanded="false" initially
    Verify mobile toggle initial state

the mobile menu toggle should have aria-expanded="true"
    Verify mobile toggle expanded state

the header should be fully rendered within 500 milliseconds
    Measure header loading time

I navigate to "Services" page
    Navigate to services page

the header height should match the homepage header height
    Compare header heights

the header should not cause cumulative layout shift (CLS)
    Check for layout shifts

the header HTML should not include inline JavaScript or dangerous eval patterns
    Scan header for unsafe scripts

the logo link should point to "/" and support SEO best practices
    Validate logo link destination

the site language is set to French
    Change site language to French

navigation items should display correctly with accented characters
    Verify accented character display

I hover over the "Portfolio" link
    Hover over portfolio link

it should display a hover effect (e.g., color change, underline)
    Verify hover effect

I tab to the "Contact" button
    Tab to contact button

it should display a clear focus ring or outline
    Verify focus indicator

I scroll down 200 pixels
    Scroll page vertically    200

the header should maintain its expected scroll behavior (fixed/sticky/collapsible)
    Verify header scroll behavior

the logo image fails to load
    Simulate logo image failure

the header layout should not break
    Verify header layout integrity

the header should render with consistent spacing and alignment across major browsers
    Compare header rendering across browsers

I use only Tab and Enter keys
    Navigate with keyboard only

I should be able to access all interactive header elements
    Verify keyboard accessibility

I am on a touch-enabled device or emulator
    Switch to touch device mode

the "Contact" button should respond to tap gestures
    Verify touch responsiveness

I open print preview
    Open print preview dialog

the header should be visible and legible
    Verify print preview header

the OS is in dark mode
    Enable dark mode

the header should use appropriate dark-mode colors
    Verify dark mode styling

I click the "Blog" link
    Click on blog link

a tracking event should be sent (e.g., via dataLayer or analytics API)
    Verify analytics event triggered

the viewport width is
    [Arguments]    ${width}
    Set browser viewport width    ${width}

the header is checked for contact button
    Look for contact button in header

the contact button is examined
    Inspect contact button properties

the contact button attributes are checked
    Examine contact button attributes

the header is checked for mobile menu
    Look for mobile menu toggle

the page is loaded
    Wait for page to load completely

the header element is examined
    Inspect header element properties

the navigation element is checked
    Examine navigation element

the mobile menu toggle is checked
    Inspect mobile menu toggle

the loading time is measured
    Time page loading process

the header is rendered
    Wait for header to render

the header source is examined
    Inspect header html source

the logo link is checked
    Examine logo link properties

the navigation items are displayed
    Verify navigation items visibility

the navigation section is checked
    Examine navigation section

the navigation links are examined
    Inspect navigation links

the header content is checked
    Examine header content

the page is checked for the header
    Look for header on page