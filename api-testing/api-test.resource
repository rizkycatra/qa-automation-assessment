*** Settings ***
#Core libraries for JSON handling and HTTP requests
Library     Collections
Library     RequestsLibrary


*** Variables ***
${BASE_URL}     https://jsonplaceholder.typicode.com


*** Keywords ***
Create API Connection
    # Initializes the session connection for every request
    Create Session    jsonplaceholder    ${BASE_URL}

Get Posts Data By ID
    [Arguments]    ${id}
    # Using arguments to make the data dynamic to test any ID
    ${response}=    GET On Session    jsonplaceholder    /posts/${id}    expected_status=any
    RETURN    ${response}

Verify Status Code
    [Arguments]    ${response}    ${expected_code}
    # Using arguments to make the data dynamic to check actual vs expected status code
    Should Be Equal As Integers    ${response.status_code}    ${expected_code}

Verify Response Field
    [Arguments]    ${response}    ${field}    ${expected_value}
    # Parses the JSON response body to validate specific key-value
    ${actual_value}=    Set Variable    ${response.json()['${field}']}
    Should Be Equal As Strings    ${actual_value}    ${expected_value}

Create New Post
    [Arguments]    ${title}    ${body}    ${userid}
    # Create a dictionary to be sent as a JSON payload
    ${payload}=    Create Dictionary    title=${title}    body=${body}    userId=${userid}
    ${response}=    POST On Session    jsonplaceholder    /posts    json=${payload}
    RETURN    ${response}

Update Post Data
    [Arguments]    ${id}    ${title}    ${body}    ${userid}
    # Create a dictionary to be sent as a JSON payload
    ${payload}=    Create Dictionary    id=${id}    title=${title}    body=${body}    userId=${userid}
    ${response}=    PUT On Session    jsonplaceholder    /posts/${id}    json=${payload}
    RETURN    ${response}

Delete Post Data
    [Arguments]    ${id}
    ${response}=    DELETE On Session    jsonplaceholder    /posts/${id}
    RETURN    ${response}
