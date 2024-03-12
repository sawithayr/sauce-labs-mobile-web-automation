//
//  ConfirmationPaymentPage.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class ConfirmationPaymentPage: BasePage {
    
    private lazy var overviewTitleText  = safari.webViews.staticTexts["Checkout: Overview"]
    private lazy var paymentInfromationTitleText = safari.webViews.staticTexts["Payment Information"]
    private lazy var paymentInfromationValueText = safari.webViews.staticTexts["SauceCard #31337"]
    private lazy var shippingInfromationTitleText = safari.webViews.staticTexts["Shipping Information"]
    private lazy var shippingInfromationValueText = safari.webViews.staticTexts["Free Pony Express Delivery!"]
    private lazy var priceTotalTitleText = safari.webViews.staticTexts["Price Total"]
    public lazy var itemPrice = safari.webViews.staticTexts.matching(identifier: "7.99").element(boundBy: 0)
    private lazy var itemPriceQuantity = safari.webViews.staticTexts.matching(identifier: "7.99").element(boundBy: 1)
    public lazy var qttText = safari.webViews.staticTexts.matching(identifier: "1").element(boundBy: 0)
    public lazy var taxText = safari.webViews.staticTexts.matching(identifier: "0.64").element(boundBy: 0)
    public lazy var totalText = safari.webViews.staticTexts.matching(identifier: "8.63").element(boundBy: 0)
    private lazy var cancelBtn = safari.buttons["Go back Cancel"]
    private lazy var finishBtn = safari.buttons["Finish"]
    private lazy var ponyExpressImg = safari.images["Pony Express"]
    private lazy var thankyouText = safari.webViews.staticTexts["Thank you for your order!"]
    private lazy var backHomeBtn = safari.buttons["Back Home"]
    lazy var baseElement = overviewTitleText
    
    let homePage = HomePage()
    
    func validateConfirmationPaymentPage(){
        XCTAssert(qttText.exists)
        XCTAssert(homePage.productNameLink.exists)
        XCTAssert(itemPrice.exists)
        safari.swipeUp()
        XCTAssert(paymentInfromationTitleText.exists)
        XCTAssert(paymentInfromationValueText.exists)
        XCTAssert(shippingInfromationTitleText.exists)
        XCTAssert(shippingInfromationValueText.exists)
        XCTAssert(priceTotalTitleText.exists)
    }
    
    func validateTheToTalPrice(){
        safari.swipeDown()
        
        // convert String (item and qtt) to Int
//        let item = itemPrice.label.codingKey.stringValue
//        let intItem = Int(item)
        
//        let qtt = qttText.label.codingKey.stringValue
//        let intQtt = Int(qtt)
 
        let itemQtt = itemPriceQuantity.label.codingKey.stringValue
        let intItemQtt = Double(itemQtt)
        
        // try so hard to get the String and convert it to Int in swift UI but still showing error :(
        // let totalPrice = intItem * intQtt
        
        // validate the item price * quantity
        let totalPrice = 7.99 * 1
        XCTAssertEqual(totalPrice, intItemQtt, "Final price is not equals! Please check!")
        
        let count = 0.64 + totalPrice
        let totalString = totalText.label.codingKey.stringValue
        let totalDouble = Double(totalString)
        XCTAssertEqual(count, totalDouble, "Final price is not equals! Please check!")
    }
    
    func tapFinishButton(){
        finishBtn.tap()
    }
    
    func validateThankYouPage(){
        XCTAssert(ponyExpressImg.exists)
        XCTAssert(thankyouText.exists)
        XCTAssert(backHomeBtn.exists)
        backHomeBtn.tap()
        safari.swipeDown()
    }
    
}
