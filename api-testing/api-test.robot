*** Settings ***
# Imports the logic and setup from the resource file
Resource        api-test.resource
# Create connection session before any test cases run
Suite Setup     Create API Connection


*** Test Cases ***
Scenario: Get A Post By Id And Verify Response
    ${response}    Get Posts Data By ID   88
    Verify Status Code    ${response}    200
    # Ensuring the backend returns the correct data mapping for the requested ID
    Verify Response Field    ${response}    userId    9
    Verify Response Field     ${response}    id    88
    Verify Response Field    ${response}    title    sapiente omnis fugit eos
    Verify Response Field   ${response}    body    consequatur omnis est praesentium\nducimus non iste\nneque hic deserunt\nvoluptatibus veniam cum et rerum sed

Scenario: Create And Verify New Post
    # Test POST method to create a new posts
    ${response}    Create New Post    The Title    The body text    5
    Verify Status Code    ${response}    201
    # Verifies that the server reflects the sent data back in the response
    Verify Response Field    ${response}    title    The Title
    Verify Response Field    ${response}    body    The body text
    Verify Response Field    ${response}    userId    5
    Verify Response Field    ${response}    id    101

Scenario: Update An Existing Post
    # Tests the PUT method for posts updates
    ${response}    Update Post Data   2    The Post update    some text update here    5
    Verify Status Code    ${response}    200
    Verify Response Field    ${response}    title    The Post update 
    Verify Response Field    ${response}    body    some text update here
    Verify Response Field    ${response}    userId    5
    Verify Response Field    ${response}    id    2

Scenario: Delete A Post From The System
    ${response}    Delete Post Data    2
    Verify Status Code    ${response}    200
    ${response_body}=    Set Variable    ${response.json()}
    Should Be Empty    ${response_body}

Scenario: Get A Non-Existing Post
    # Negative Test, Ensures the API handles invalid IDs with the correct 404 error code
    ${response}    Get Posts Data By ID    9999
    Verify Status Code    ${response}    404
