*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME_ANDROID}    Android
${DEVICE_NAME_ANDROID}    emulator-5554
${APP_ANDROID}    ${CURDIR}${/}app${/}ApiDemos-debug.apk
${AUTOMATION_NAME}    appium

*** Test Cases ***
Open Android app
    Open Application Android

TEST_CASE Scroll to View
    Wait Until Element Is Visible  accessibility_id=Views
    Click Element  accessibility_id=Views
    IF_ELSE_CONDITION

Close Application
    Close All Application

*** Keywords ***
Open Application Android
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    deviceName=${DEVICE_NAME_ANDROID}    app=${APP_ANDROID}    automationName=${AUTOMATION_NAME}

Close All Application
    Close All Applications

IF_ELSE_CONDITION
    FOR    ${i}    IN RANGE    0    10
        ${CHECK_ELEMENT}    Run Keyword and Return Status    Element Should Be Visible    accessibility_id=ScrollBars
        Run Keyword If    ${CHECK_ELEMENT} == True
        ...    Run Keywords    Wait Until Keyword Succeeds    3x    3s    Click Element    accessibility_id=ScrollBars
        ...    AND    Exit For Loop
        ...    ELSE    Swipe By Percent    50    90    20    50
    END