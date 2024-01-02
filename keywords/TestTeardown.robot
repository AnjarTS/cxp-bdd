*** Settings ***
Documentation    Test setup keywords for all test cases
Library           SeleniumLibrary

*** Keywords ***
Open Browser and Navigate to Login Page
    [Documentation]    Open the browser and navigate to the login page
    Open Browser    ${LOGIN_PAGE_URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    ${SELENIUM_SPEED}

Login with Valid Credentials
    [Documentation]    Log in with valid credentials
    [Arguments]       ${username}    ${password}
    Open Login Page
    Input Username    ${username}
    Input Password    ${password}
    Click Login Button

*** Variables ***
${LOGIN_PAGE_URL}    http://example.com/login
${SELENIUM_SPEED}    0.5
