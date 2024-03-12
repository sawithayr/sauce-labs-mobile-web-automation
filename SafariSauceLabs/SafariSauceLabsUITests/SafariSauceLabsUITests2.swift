//
//  SafariSauceLabsUITests.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 08/03/24.
//  

import XCTest

final class SafariSauceLabsUITests: XCTestCase {
    
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    
    
    let userFirstName = "Sawitha Yuliana"
    let userLastName = "Rinaldy"
    let userPostalCode = "999999"

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
//        safari.terminate()
    }

    func testExample() throws {
        // Launch the safari app
        safari.launch()
        
        // Input address and go
        _ = safari.wait(for: .runningForeground, timeout: 30)
        safari.textFields["Address"].tap()
        safari.typeText("https://www.saucedemo.com/")
        safari.keyboards.buttons["Go"].tap()
        
        // Wait the title text is displayed
        let title = safari.webViews.staticTexts["Swag Labs"]
        let pageLoaded = title.waitForExistence(timeout: 30)
        XCTAssert(pageLoaded, "Verify Web Page Loaded")
        
        // Input the username
        let username = safari.textFields["Username"]
        username.tap()
        username.typeText("standard_user")
        
        // Input the password
        let password = safari.secureTextFields["Password"]
        password.tap()
        password.typeText("secret_sauce")
        safari.toolbars.buttons["Done"].tap()
        
        // Click the Login button
        let loginBtn = safari.buttons["Login"]
        loginBtn.tap()
        
        // Verify in homepage
        let homepageTitle = safari.webViews.staticTexts["Products"]
        XCTAssert(homepageTitle.waitForExistence(timeout: 30), "Verify Web Page Loaded")
        
        // Close the password save option
        let notNowBtn = safari.buttons["Not Now"]
        notNowBtn.tap()
        
        // Add item (Sauce Labs Onesie) from homepage
        safari.swipeUp()
        let addToCartBtn = safari.buttons.matching(identifier: "Add to cart").element(boundBy: 4)
        addToCartBtn.tap()
        XCTAssert(safari.buttons["Remove"].waitForExistence(timeout: 3), "Verify button Remove is present")
        
        // Navigate to cart details
        safari.swipeDown()
        let cartBtn = safari.webViews.staticTexts["1"]
        cartBtn.tap()
//        XCTAssert(safari.links["Sauce Labs Onesie"].isEnabled, "Verify added the selected item")
        
        // Checkout proccess
        safari.swipeUp()
        let checkoutBtn = safari.buttons["Checkout"]
        checkoutBtn.tap()
        safari.swipeUp()
        XCTAssert(safari.webViews.staticTexts["Checkout: Your Information"].isEnabled, "Verify checkout page")
        
        // Field the user data
        let firstName = safari.textFields["First Name"]
        firstName.tap()
        safari.typeText(userFirstName)
        safari.toolbars.buttons["Done"].tap()
        
        let lastName = safari.textFields["Last Name"]
        lastName.tap()
        safari.typeText(userLastName)
        safari.toolbars.buttons["Done"].tap()
        
        let postal = safari.textFields["Zip/Postal Code"]
        postal.tap()
        safari.typeText(userPostalCode)
        safari.toolbars.buttons["Done"].tap()
        
        let continueBtn = safari.buttons["Continue"]
        continueBtn.tap()
        
        let finishBtn = safari.buttons["Finish"]
        finishBtn.tap()
        
        XCTAssert(safari.webViews.staticTexts["Thank you for your order!"].isEnabled, "Verify payment is success")
        
        let backHomeBtn = safari.buttons["Back Home"]
        backHomeBtn.tap()
        
        

        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
