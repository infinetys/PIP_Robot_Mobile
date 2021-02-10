*** Settings ***
Library           AppiumLibrary
Library           Screenshot

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME_IOS}    iOS
${DEVICE_NAME_IOS}    iPhone 12 Pro Max
${APP_IOS}      ${CURDIR}${/}..${/}${/}app${/}ios${/}CheckCovid.app
${AUTOMATION_NAME}    XCUITest
${PLATFORM_VERSION}     14.4

robot -T -D     ${CURDIR}${/}..${/}${/}screenshot

*** Test Cases ***
Open IOS App
    Open Application Android

# TEST_CASE Scroll to View
#     Wait Until Element Is Visible  accessibility_id=Views
#     Click Element  accessibility_id=Views
#     IF_ELSE_CONDITION

# Close Application
#     Close All Application

*** Keywords ***
Open Application Android
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_IOS}    deviceName=${DEVICE_NAME_IOS}    app=${APP_IOS}    automationName=${AUTOMATION_NAME}    platformVersion=${PLATFORM_VERSION}


Close All Application
    Close All Applications

# IF_ELSE_CONDITION
#     FOR    ${i}    IN RANGE    0    10
#         ${CHECK_ELEMENT}    Run Keyword and Return Status    Element Should Be Visible    accessibility_id=ScrollBars
#         Run Keyword If    ${CHECK_ELEMENT} == True
#         ...    Run Keywords    Wait Until Keyword Succeeds    3x    3s    Click Element    accessibility_id=ScrollBars
#         ...    AND    Exit For Loop
#         ...    ELSE    Swipe By Percent    50    90    20    50
#     END

