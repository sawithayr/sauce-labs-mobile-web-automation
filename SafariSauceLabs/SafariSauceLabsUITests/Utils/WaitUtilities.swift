//
//  WaitUtilities.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import XCTest

public func waitUntilElementDisappear(
    element: XCUIElement,
    timeOut: Double = BaseTest.Constants.defaultWaitTime
) {
    var elementVisible = true
    let startTime = NSDate().timeIntervalSince1970
    
    while (NSDate().timeIntervalSince1970 - startTime) < timeOut {
        if !element.exists {
            elementVisible = false
            break
        }
        usleep(300_000) // 300ms
    }
    
    XCTAssert(elementVisible, "\(element) is still visible")
}

func waitForPageLoading(element: XCUIElement) {
    XCTAssertTrue(element.waitForExistence(timeout: BaseTest.Constants.defaultLoadingTime))
}

func waitForElementToPresent(element: XCUIElement) {
    XCTAssertTrue(element.waitForExistence(timeout: BaseTest.Constants.defaultWaitTime))
}
