//
//  UserInformationPage.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class UserInformationPage: BasePage {
    
    private lazy var yourInformationTitleText  = safari.webViews.staticTexts["Checkout: Your Information"]
    private lazy var firstNameField = safari.textFields["First Name"]
    private lazy var lastNameField = safari.textFields["Last Name"]
    private lazy var postalField = safari.textFields["Zip/Postal Code"]
    private lazy var cancelBtn  = safari.buttons["Go back Cancel"]
    private lazy var continueBtn  = safari.buttons["Continue"]
    lazy var baseElement = yourInformationTitleText
    
    func validateUserInformationPage(){
        safari.swipeDown()
        XCTAssert(yourInformationTitleText.exists)
        XCTAssert(firstNameField.exists)
        XCTAssert(lastNameField.exists)
        XCTAssert(postalField.exists)
        XCTAssert(cancelBtn.exists)
        XCTAssert(continueBtn.exists)
    }
    
    func inputUserInformation(firstName: String, lastName: String, postal: String){
        firstNameField.tap()
        firstNameField.typeText(firstName)
        safari.toolbars.buttons["Done"].tap()
        lastNameField.tap()
        lastNameField.typeText(lastName)
        safari.toolbars.buttons["Done"].tap()
        postalField.tap()
        postalField.typeText(postal)
        safari.toolbars.buttons["Done"].tap()
        continueBtn.tap()
    }
    
}
