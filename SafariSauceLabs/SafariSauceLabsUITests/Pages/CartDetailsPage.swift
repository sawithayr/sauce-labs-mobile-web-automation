//
//  CartDetailsPage.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class CartDetailsPage: BasePage {
    
    private lazy var yourCartTitleText  = safari.webViews.staticTexts["Your Cart"]
    private lazy var continueShoppingBtn  = safari.buttons["Go back Continue Shopping"]
    private lazy var checkoutBtn  = safari.buttons["Checkout"]
    lazy var baseElement = yourCartTitleText
    
    let homePage = HomePage()
    
    func validateCartDetailsPage(){
        //validate the cart quantity
        XCTAssert(homePage.qttOneText.exists)
        XCTAssert(homePage.productNameLink.exists)
        XCTAssert(homePage.cheapItemPriceText.exists)
        XCTAssert(homePage.removeCartBtn.exists)
        safari.swipeUp()
        XCTAssert(continueShoppingBtn.exists)
        XCTAssert(checkoutBtn.exists)
    }
    
    func tapChekoutButton(){
        checkoutBtn.tap()
    }
    
}
