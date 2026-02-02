*** Settings ***
# Core libraries for data and browser automation
Library     Collections
Library     String
Library     SeleniumLibrary


*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      chrome


*** Keywords ***
User Open The Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

User Choose Category "${category_name}"
    #M
    Wait Until Element Is Visible    link=${category_name}    5s
    Click Link    ${category_name}

User Select Product "${product_name}"
    # Using dynamic xpath to select a specific product based on the test case argument
    # Can reuse this keyword to test other product
    ${product_xpath}=    Set Variable    xpath://a[contains(text(),'${product_name}')]
    Wait Until Element Is Visible    ${product_xpath}    5s
    Click Element    ${product_xpath}

User Add The Product To Cart
    Wait Until Element Is Visible    link=Add to cart    5s
    Click Link    Add to cart
    Alert Should Be Present    Product added

User Navigates To Cart Page And Verifies "${product_name}"
    # Verifies the item persistence from the product page to the cart page
    Click Link    id:cartur
    Wait Until Page Contains    ${product_name}    10s

User Fills The Checkout Form
    [Arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    # Interacting with a modal overlay for data submission
    Click Button    xpath://button[text()='Place Order']
    Wait Until Element Contains    id=orderModalLabel    Place order    5s
    Input Text    id=name    ${name}
    Input Text    id=country    ${country}
    Input Text    id=city    ${city}
    Input Text    id=card    ${card}
    Input Text    id=month    ${month}
    Input Text    id=year    ${year}
    Click Button    xpath://button[text()='Purchase']

User Capture The Order ID And Finishes The Purchase
    Wait Until Page Contains    text=Thank you for your purchase!
    ${get_purchase_data}=    Get Text    xpath://p[contains(@class, 'lead')]
    # Parsing the multiline string to isolate the specific Order ID
    @{lines}=    Split String    ${get_purchase_data}    \n
    ${id_line}=    Get From List    ${lines}    0
    ${order_id}=    Replace String    ${id_line}    Id:    ${EMPTY}
    ${order_id}=    Strip String    ${order_id}
    # Logging the ID to the Robot Framework report
    Log    Your Order ID:${order_id}

    Sleep    1s
    Click Button    xpath://button[contains(@class, 'confirm')]
    Wait Until Location Contains    index    10s

Finish Test
    Close Browser
