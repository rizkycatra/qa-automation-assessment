# Mobile Testing Automation: WebdriverIO Demo App

## Setup Step
Setting up all of environment needed on **Ubuntu 22.04**

### **Step 1: Framework Installation**
I used the Robot Framework for its readability and unified reporting.
* **Robot Framework:** `pip install robotframework`
* **Appium Library:** `pip install robotframework-appiumlibrary`

### **Step 2: Appium Server 2.0 Setup**
* **Server:** `npm install -g appium`
* **UIAutomator2 Driver:** `appium driver install uiautomator2`

### **Step 3: Android SDK & Environment Variables**
Configured the `.bashrc`:
```
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
```
### **Step 4: Android Studio**
Create Virtual Device/ Emulator, using Google Pixel 5 with API 30 or higher

## Element Locator Strategy
I use Appium selector to help refine the locator to ensure use the precise locators.
- **Accessibility ID**: The primary locator for buttons and inputs (ex, accessibility_id=login).
- **Resource ID**: Used for Alert dialogs (ex, id=android:id/message).
- **Text**: Used when some primary locator are not available.
- **Coordinate**: Used when set the swipe keyword, I need calculated percentages relative to the 1080x2340 screen resolution to ensure the swipe works across different devices, or just using Coordinates feature on Appium selector to set the x,y coordinate

## AI Tools Utilized
### Tool: Gemini
- **Logic Refinement:** The AI helped polished the logic code, for example transition from simple "coordinate clicking" to dynamic FOR Loop for multiple swipes and dynamic argument handling for the dropdown menu.
- **Debugging:** Debugging lot of stuffs related the Appium setup. For example suggest to use `Activate Application` keyword when i have problem can't connect to Android studio emulator.
- **Math Calculation:** calculate precise start/end coordinates for a swipe gesture based on emulator screen percentages.

## Mobile Automation Test Result
- The result video and report can be seen on .../mobile-testing/screenshoot/ folder