*** Settings ***
# Imports the logic and setup from the resource file
Resource            test-script.resource
# The browser closes after every test, regardless of pass or fail
Test Teardown       Finish Test


*** Test Cases ***
Scenario: Complete Purchase Flow
    User Open The Website
    #Navigate any category the option is Monitors, Phones, Laptops
    User Choose Category "Monitors" 
    #Product selection within the chosen category
    User Select Product "Apple monitor 24"
    User Add The Product To Cart
    User Navigates To Cart Page And Verifies "Apple monitor 24"
    #Inputting customer information into the checkout modal
    User fills the checkout form    Rizky    Indonesia    Yogyakarta    78734999921    01    2026
    User capture the order ID and finishes the purchase
