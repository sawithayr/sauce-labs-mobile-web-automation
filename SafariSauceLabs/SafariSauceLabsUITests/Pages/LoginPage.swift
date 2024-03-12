//
//  LoginPage.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class LoginPage: BasePage {
    
    private lazy var pageTitleText = safari.webViews.staticTexts["Swag Labs"]
    private lazy var usernameField = safari.textFields["Username"]
    private lazy var passwordField = safari.secureTextFields["Password"]
    private lazy var loginBtn = safari.buttons["Login"]
    private lazy var errorLockedUser = safari.webViews.staticTexts["Epic sadface: Sorry, this user has been locked out."]
    lazy var baseElement = pageTitleText
    
    func validateLoginPageLoaded(){
        XCTAssert(pageTitleText.exists)
        XCTAssert(usernameField.exists)
        XCTAssert(passwordField.exists)
        XCTAssert(loginBtn.exists)
    }
    
    func loginWithValidUserNameAndPassword(username: String, password: String){
        //input username
        usernameField.tap()
        usernameField.typeText(username)
        safari.toolbars.buttons["Done"].tap()
        
        // input password
        passwordField.tap()
        passwordField.typeText(password)
        safari.toolbars.buttons["Done"].tap()
        
        //click login button
        loginBtn.tap()
    }
    
    func validateErrorLockedUser(){
        XCTAssertTrue(errorLockedUser.exists, "The error message is not present!")
    }
    
    func validateErrorLockedUserNotDisplayed() -> Bool{
        return !errorLockedUser.exists
    }
    
    func replaceUsername(username: String){
        usernameField.tap()
        usernameField.doubleTap()
        usernameField.press(forDuration: 1)
        usernameField.doubleTap()
        usernameField.press(forDuration: 1)
        if (safari.menuItems["Select All"].exists == true){
            safari.menuItems["Select All"].tap()
            usernameField.typeText(XCUIKeyboardKey.delete.rawValue)
        }
        usernameField.tap()
        usernameField.typeText(username)
        safari.toolbars.buttons["Done"].tap()
        loginBtn.tap()
    }
    
    func loginWithMultipleUsers(password: String){
        usernameField.tap()
        
    }
    
}
