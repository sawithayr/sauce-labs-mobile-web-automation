//
//  LoginPageTest.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class LoginPageTest: BaseTest {
    let loginPage = LoginPage()
    
    override func setUp() {
        super.setUp()
        waitForPageLoading(element: loginPage.baseElement)
    }
    
    func validateLoginPage() throws {
        loginPage.validateLoginPageLoaded()
    }
}
