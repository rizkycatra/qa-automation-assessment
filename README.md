# Comprehensive Documentation


## Executive Summary
**What you tested across all three platforms**
- **Web (Part 1):** Testing end to end purchasing a product on Demoblaze Web. From choosing the product by category until completing the checkout form and capturing the order ID (**Robot Framework with Selenium Library**)
- **API (Part 2):** Testing positive and negative case with **/posts** endpoints using GET, POST, PUT, and DELETE method. Also validating the status code and the response body. (**Robot Framework with Requests Library**)
- **Mobile (Part 3):** Testing the WebdriverIO Demo App on Android, covering Login, Forms, and Swipe test. (**Robot Framework with Appium Library**)

**Overall test results summary**

All test suites (Web, API, Mobile) achieved a 100% Pass Rate. The report and video attached on each testing folder.
- api-testing/results
- web-testing/screenshoot
- mobile-testing/screenshots

**Key findings and insights**
- Building the automation test for web, API, and mobile have different characteristics.  


## AI Tools Usage Report

**Which AI tools you used for each testing part**
- Gemini and Copilot (VS Code)

**How these tools accelerated your testing process**
- Reduced troubleshooting/debug time and effort for setup or scripting process
- Assisted in identifying suitable locators

**Specific examples of AI-generated code or test cases**
- Assisted in refining the correct xpath and refining string parsing on capturing order ID case. (Web Test)
- Assisted to calculate precise x,y start/end coordinates for a swipe based on emulator screen percentages.


**Pros and cons of using AI for test automation**

Pros:
- Can polish the script logic
- Help a lot during debugging issue
- Helps with documentation writing

Cons:
- Suggestion code still requires human review
- Sometimes suggest unstable locators
- Sometimes suggest deprecated keywords


## Test Flow Diagram

The flow diagram attached on each testing folder
- api-testing/results
- web-testing/screenshoot
- mobile-testing/screenshots


## Edge Cases & Quality Insights

**Identify at least 5 edge cases that could break the applications**
1. Checkout without adding any product to cart **(Web Test)**. The actual result we can get the order ID and complate the purchase flow.
2. Checkout with no internet connection **(Web Test)**. The actual result we can get the order ID and complate the purchase flow.
3. Trigger error 500 on jsonplaceholder /posts endpoint **(Web Test)**. The actual result is no error message handling when we get error status code 500.
4. Login with no internet connection **(Mobile Test)**. The actual result is user can input the credential and successfully login without internet connection
5. Login with any email and password **(Mobile Test)**. The actual result there's no validation on Login form to check incorect email and password.

**Propose how you would test these edge cases**
1. Checkout without adding any product to cart **(Web Test)**
    - Automate navigation directly to the cart page without adding a product
    - Attempt to proceed with checkout
    - Verify if the system blocks the checkout process and displays an appropriate warning message
2. Checkout with no internet connection **(Web Test)**
    - Simulate network disconnection using browser developer tools or OS network settings before checkout 
    - Attempt to complete the purchase flow
    - Validate that the application handles the network error properly and does not generate an order ID
3. Trigger error 500 **(Web Test)**
    - Mock the API response to return a 500 status code
    - Hit the /posts endpoint
    - Verify that error message is retrieved
4. Login with no internet connection **(Mobile Test)**
    - Disable network connection on the emulator before submitting login credentials
    - Attempt login and check the application behavior
    - Verify that the app displays a network-related error message and block the login process
5. Login with any email and password **(Mobile Test)**
    - Perform login attempts using invalid or random credentials
    - Verify that proper validation messages are shown, for example incorrect email or password
    - Ensure that access is denied for unauthorized users

## Scalability Strategy (Bonus)
**If you had to scale this to 100+ test cases, how would you approach it?**

- Separate test data from the logic (On robot framework, the test case on `.robot` and the logic on `.resource`)
- Use reusable keywords (On robotframework)

**Framework suggestions**

- Robot Framework
    - Robot Framework uses a keyword-driven syntax that is close to natural language, making test cases easy to read and maintain by both technical and non-technical team members, beginner friendly
    - It integrates well with SeleniumLibrary for web testing, AppiumLibrary for mobile testing, and RequestsLibrary for API testing, allowing one framework to be used across different platforms.

**CI/CD integration ideas**

Still need to learn about the CI/CD things

**Long-term maintenance strategy**

-
