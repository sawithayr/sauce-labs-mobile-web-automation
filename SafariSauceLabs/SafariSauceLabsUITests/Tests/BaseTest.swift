//
//  BaseTest.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

open class BaseTest: XCTestCase {
    private var basePage = BasePage()
    
    public enum Constants {
        public static let defaultWaitTime = 10.0
        public static let defaultLoadingTime = 30.0
    }
    
    lazy var safari = basePage.safari
    
    open override func setUp() {
        safari.launch()
        
        _ = safari.wait(for: .runningForeground, timeout: 30)
        safari.textFields["Address"].tap()
        safari.typeText("https://www.saucedemo.com/")
        safari.keyboards.buttons["Go"].tap()
        
        safari.launchArguments = ["enable-testing"]
        continueAfterFailure = false
    }
    
    open override func tearDown() {
        super.tearDown()
        safari.terminate()
    }
    
}
