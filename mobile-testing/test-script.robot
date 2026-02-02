*** Settings ***
# Imports the logic and setup from the resource file
Resource        test-script.resource
Test Teardown   Close Application

*** Test Cases ***
Scenario: Login Flow
    User Open WebdriverIO Demo Application
    User Navigate To Home Screen
    User Click The Menu    Login
    User Navigates To Login Menu
    User Fills The Email, Password And Submit    rizky_test@test.com    rahasia12345
    User Successfully Login

Scenario: Forms Test
    User Open WebdriverIO Demo Application
    User Navigate To Home Screen
    User Click The Menu    Forms
    User Navigate To Forms Menu
    User Fills Input Field Forms And Verifies    Rizky Hello
    User Switch The Toggle OFF And Verifies
    User Switch The Toggle ON And Verifies
    User Choose The Option From Dropdown    2
    User Click The Buttons

Scenario: Swipe Test
    User Open WebdriverIO Demo Application
    User Navigate To Home Screen
    User Click The Menu    Swipe
    User Navigate To Swipe Menu
    User Swipe Screen From Right To Left And Verify The Card
    User Swipe Screen From Left To Right And Verify The Card
    User Swipe Up And Verify The Content
    User Swipe Down And Verify The Content