# API Automation: JSONPlaceholder API Testing

## Test Covered
| Test Case Name|Case |Request Method | Expected Status | Actual Status |Description|
| ----------- | ----------- | ----------- | ----------- |----------- |----------- |
| Get A Post By Id And Verify Response | Positive |GET|200|200|Retrieves an existing post by ID and validates the response body|
| Create And Verify New Post | Positive |POST|201|201|Creation a new post and verifies the status and response body|
| Update An Existing Post | Positive |PUT|200|200|Updates an existing posts and verifies the reflected changes in the response body|
| Delete A Post From The System | Positive |DELETE|200|200|Removes a post and validates the status code|
| Get A Non-Existing Post | Negative |GET|404|404|Retrieve a non-existing ID to verify error handling|

## API Automation Test Result
- The result video and report can be seen on .../api-testing/result/ folder