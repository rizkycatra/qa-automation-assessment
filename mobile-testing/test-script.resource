*** Settings ***
# Core library for Mobile Automation
Library     AppiumLibrary


*** Variables ***
# Configuration for the local Appium server and Android Emulator
${REMOTE_URL}           http://127.0.0.1:4723
${PLATFORM_NAME}        Android
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.wdiodemoapp
${APP_ACTIVITY}         .MainActivity
${AUTOMATION_NAME}      UiAutomator2


*** Keywords ***
User Open WebdriverIO Demo Application
    # Establishes connection to the Appium server and launches the specific app package
    Open Application    ${REMOTE_URL}
    ...    automationName=${AUTOMATION_NAME}
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    noReset=false
    Activate Application    com.wdiodemoapp

User Navigate To Home Screen
    Wait Until Page Contains    Demo app for the appium-boilerplate    timeout=20s

User Click The Menu
    [Arguments]    ${menu}
    Click Element    accessibility_id=${menu}

User Navigates To Login Menu
    Wait Until Page Contains    Login / Sign up Form    timeout=10s

User Fills The Email, Password And Submit
    [Arguments]    ${email}    ${password}
    Click Element    accessibility_id=input-email
    Input Text Into Current Element    ${email}
    Input Password    accessibility_id=input-password    ${password}
    Click Element    accessibility_id=button-LOGIN

User Successfully Login
    # Handling dialogs/Alerts
    Wait Until Page Contains    You are logged in!    timeout=10s
    Click Element    id=android:id/button1

User Navigate To Forms Menu
    Wait Until Page Contains    Form components    timeout=10s

User Fills Input Field Forms And Verifies
    [Arguments]    ${text_input}
    # Validates data  between input and label
    Click Element    accessibility_id=text-input
    Input Text Into Current Element    ${text_input}
    Element Text Should Be   accessibility_id=input-text-result    ${text_input}

User Switch The Toggle OFF And Verifies    
    # logic to check current switch state before interacting
    ${switch_status}=    Get Element Attribute   accessibility_id=switch    checked
    IF    '${switch_status}' == 'false'
        Click Element    accessibility_id=switch
    END
    Element Attribute Should Match    accessibility_id=switch    checked    true
    Element Text Should Be    accessibility_id=switch-text    Click to turn the switch OFF

User Switch The Toggle ON And Verifies    
    ${switch_status}=    Get Element Attribute   accessibility_id=switch    checked
    IF    '${switch_status}' == 'true'
        Click Element    accessibility_id=switch
    END
    Element Attribute Should Match    accessibility_id=switch    checked    false
    Element Text Should Be    accessibility_id=switch-text    Click to turn the switch ON

User Choose The Option From Dropdown
    [Arguments]    ${option}
    # Handling mobile pickers by mapping numeric arguments to specific text values
    Click Element    accessibility_id=Dropdown
    Wait Until Element Is Visible    class=android.widget.ListView    timeout=10s
    IF    '${option}'=='1'
        ${text_value}=    Set Variable  webdriver.io is awesome
    ELSE IF    '${option}'=='2'
        ${text_value}=    Set Variable    Appium is awesome
    ELSE IF    '${option}'=='3'
        ${text_value}=    Set Variable    This app is awesome
    END
    Click Text    ${text_value}
    Wait Until Page Contains    ${text_value}    timeout=10s

User Click The Buttons
    Click Element    accessibility_id=button-Active
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout    timeout=10s
    Element Text Should Be    id=android:id/message    This button is active
    Click Text    OK
    Wait Until Page Contains    Form components    5s

User Navigate To Swipe Menu
    Wait Until Page Contains    Swipe horizontal    timeout=10s

User Swipe Screen From Right To Left And Verify The Card
    # Loop to navigate a how many swipe triggered with fixed coordinates
    FOR    ${i}    IN RANGE      3 
        Swipe    start_x=990    start_y=1270    end_x=100    end_y=1270    duration=100ms
    END
    Sleep    2s
    Page Should Contain Text    SUPPORT VIDEOS   

User Swipe Screen From Left To Right And Verify The Card
    # Loop to navigate a how many swipe triggered with fixed coordinates
    FOR    ${i}    IN RANGE    3
        Swipe    start_x=100    start_y=1270    end_x=990    end_y=1270    duration=100ms
    END
    Sleep    2s
    Page Should Contain Text    FULLY OPEN SOURCE

User Swipe Up And Verify The Content
    # Vertical swipe to check hidden "footer" content
    Swipe    start_x=540    start_y=2013    end_x=540    end_y=468    duration=100ms
    Sleep    2s
    Page Should Contain Text    You found me!!!

User Swipe Down And Verify The Content
    # Returning to the top of the scroll view
    Swipe    start_x=540    start_y=468    end_x=540    end_y=2013    duration=100ms
    Sleep    2s
    Page Should Contain Text    Swipe horizontal