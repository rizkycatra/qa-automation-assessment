# Web Testing Automation: DemoBlaze Web

## Test Flow
The complete user journey to purchase a product on the DemoBlaze web:
1. **Product Discovery:** Navigate to the selected category and choose the product.
2. **Cart Management:** Add the item to the cart and verifies.
3. **Checkout Process:** Complete the "Place Order" form with filling all of the data.
4. **Data Verification:** Capture the success notification and extract the Order ID.


## Challenges & Solutions
- **Race Conditions:** Some elements sometimes didn't load fast enough. **Solution:** Implemented `Wait Until Element Is Visible` to wait the element visible.
- **Capturing Order ID:** the Order ID is returned within a single block of text. **Solution:** I Need to breaks the string first using `Split String`, `Replace String`, and `Strip String` to isolate the ID.

## AI Tool Usage
- **Gemini:** Assisted in refining the correct xpath and refining string parsing.

## Web Automation Test Result
- The result video and report can be seen on .../web-testing/screenshoot/ folder