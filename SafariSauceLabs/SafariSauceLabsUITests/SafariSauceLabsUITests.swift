//
//  SafariSauceLabsUITests.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 08/03/24.
//

import Foundation
import XCTest

final class SafariSauceLabsUITests2: BaseTest {
    let basePage = BasePage()
    let loginPage = LoginPage()
    let homePage = HomePage()
    let cartDetails = CartDetailsPage()
    let userInfo = UserInformationPage()
    let payment = ConfirmationPaymentPage()
    let standardUser = "standard_user"
    let glitchUser = "performance_glitch_user"
    let password = "secret_sauce"
    let userFirstName = "Sawitha Yuliana"
    let userLastName = "Rinaldy"
    let userPostalCode = "999999"
    let users = ["locked_out_user", "problem_user"] // username in String array
    
    override func setUp() {
        super.setUp()
        waitForPageLoading(element: loginPage.baseElement)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    
    //Automate the entire Purchase flow on Saucedemo.

    func testStandardUser() throws {
        loginPage.validateLoginPageLoaded()
        loginPage.loginWithValidUserNameAndPassword(username: standardUser, password: password)
        waitForPageLoading(element: homePage.baseElement)
        
        homePage.validateHomePageLoaded()
        homePage.selectCheaperItemFromHomepage()
        waitForPageLoading(element: cartDetails.baseElement)
        
        cartDetails.validateCartDetailsPage()
        cartDetails.tapChekoutButton()
        waitForPageLoading(element: userInfo.baseElement)
        
        userInfo.validateUserInformationPage()
        userInfo.inputUserInformation(firstName: userFirstName, lastName: userLastName, postal: userPostalCode)
        waitForPageLoading(element: payment.baseElement)
        
        payment.validateConfirmationPaymentPage()
        payment.validateTheToTalPrice()
        payment.tapFinishButton()
        payment.validateThankYouPage()
        homePage.validateHomePageLoaded()
    }

    //Case 2: Login with performance_glitch_user
    func testGlitchUser() throws {
        loginPage.validateLoginPageLoaded()
        loginPage.loginWithValidUserNameAndPassword(username: glitchUser, password: password)
        waitForPageLoading(element: homePage.baseElement)
        
        homePage.validateHomePageLoaded()
        homePage.tapFilterIcon()
        homePage.tapLowPriceFilter()
        waitForPageLoading(element: homePage.baseElement)
        homePage.validateTheCheapestProductIsDisplayed()
        homePage.tapTheFirstProduct()
        waitForPageLoading(element: cartDetails.baseElement)
        
        cartDetails.validateCartDetailsPage()
        cartDetails.tapChekoutButton()
        waitForPageLoading(element: userInfo.baseElement)
        userInfo.validateUserInformationPage()
        userInfo.inputUserInformation(firstName: userFirstName, lastName: userLastName, postal: userPostalCode)
        waitForPageLoading(element: payment.baseElement)
        
        payment.validateConfirmationPaymentPage()
        payment.validateTheToTalPrice()
        payment.tapFinishButton()
        payment.validateThankYouPage()
        homePage.validateHomePageLoaded()
    }
    
    //Case 3: Attempt to login with locked_out_user, then login with problem_user
    func testProblemUser() throws {
        loginPage.validateLoginPageLoaded()
        
        //using looping for get the different username
        for user in users {
            loginPage.loginWithValidUserNameAndPassword(username: user, password: password)
            let error = loginPage.validateErrorLockedUserNotDisplayed()
            if error == false {
                XCTAssertFalse(error, "Login failed for user: \(user)")
                super.tearDown()
                sleep(1)
                setUp()
            } else {
                waitForPageLoading(element: homePage.baseElement)
                
                homePage.validateHomePageLoaded()
                homePage.tapFilterIcon()
                homePage.tapHighPriceFilter()
                homePage.tapTheFirstProduct()
                waitForPageLoading(element: cartDetails.baseElement)
                
                cartDetails.tapChekoutButton()
                waitForPageLoading(element: userInfo.baseElement)
                userInfo.validateUserInformationPage()
                userInfo.inputUserInformation(firstName: userFirstName, lastName: userLastName, postal: userPostalCode)
                waitForPageLoading(element: payment.baseElement)
                
                payment.tapFinishButton()
                payment.validateThankYouPage()
                homePage.validateHomePageLoaded()
            }
        }
        
    }
    
}
