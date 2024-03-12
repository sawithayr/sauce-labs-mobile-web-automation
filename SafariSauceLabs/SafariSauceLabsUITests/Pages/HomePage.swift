//
//  HomePage.swift
//  SafariSauceLabsUITests
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

import Foundation
import XCTest

class HomePage: BasePage {
    
    private lazy var homepageTitleText = safari.webViews.staticTexts["Swag Labs"]
    public lazy var categoryTitleText = safari.webViews.staticTexts["Products"]
    private lazy var hamburgerMenuBtn = safari.buttons["Open Menu"]
    public lazy var cheapItemPriceText = safari.webViews.staticTexts["7.99"]
    private lazy var addToCartBtn = safari.buttons.matching(identifier: "Add to cart").element(boundBy: 4)
    public lazy var removeCartBtn = safari.buttons.matching(identifier: "Remove").element(boundBy: 0)
    public lazy var productNameLink = safari.webViews.links["Sauce Labs Onesie"]
    public lazy var priceyProductNameLink = safari.webViews.links["Sauce Labs Fleece Jacket"]
    public lazy var qttOneText = safari.webViews.staticTexts["1"]
    private lazy var notNowBtn = safari.buttons["Not Now"]
    private lazy var filterIcon = safari.otherElements["Name (A to Z)"].firstMatch
    private lazy var lowerPriceFilterBtn = safari.buttons["Price (low to high)"]
    private lazy var highPriceFilterBtn = safari.buttons["Price (high to low)"]
    private lazy var firstAddToCartBtn = safari.buttons.matching(identifier: "Add to cart").element(boundBy: 0)
    lazy var baseElement = categoryTitleText
    
    struct Product {
        let name: String
        let price: Double
    }

//    let products = [
//        Product(name: "Sauce Labs Backpack", price: 29.99),
//        Product(name: "Sauce Labs Bike Light", price: 9.99),
//        Product(name: "Sauce Labs Bolt T-Shirt", price: 15.99),
//        Product(name: "Sauce Labs Fleece Jacket", price: 49.99),
//        Product(name: "Sauce Labs Onesie", price: 7.99),
//        Product(name: "Test.allTheThings() T-Shirt (Red)", price: 15.99)
//    ]
    
//    let products = [29.99, 9.99, 15.99, 49.99, 7.99, 15.99]
    
    
    func validateHomePageLoaded(){
        if(notNowBtn.exists){
            notNowBtn.tap()
        }
        XCTAssert(homepageTitleText.exists)
        XCTAssert(categoryTitleText.exists)
        XCTAssert(hamburgerMenuBtn.exists)
    }
    
    func selectCheaperItemFromHomepage(){
        if (productNameLink.exists && cheapItemPriceText.exists == false) {
            safari.swipeUp()
        }
        addToCartBtn.tap()
        XCTAssert(removeCartBtn.exists)
        safari.swipeDown()
        qttOneText.tap()
    }
    
    func tapFilterIcon(){
        waitForElementToPresent(element: filterIcon)
        filterIcon.tap()

    }
    
    func tapLowPriceFilter(){
        waitForElementToPresent(element: lowerPriceFilterBtn)
        lowerPriceFilterBtn.tap()
    }
    
    func tapHighPriceFilter(){
        waitForElementToPresent(element: highPriceFilterBtn)
        highPriceFilterBtn.tap()
    }

    func tapTheFirstProduct(){
        if (firstAddToCartBtn.exists == false) {
            safari.swipeUp()
        }
        waitForElementToPresent(element: firstAddToCartBtn)
        firstAddToCartBtn.tap()
        XCTAssert(removeCartBtn.exists)
        safari.swipeDown()
        qttOneText.tap()
    }
    
    func validateTheCheapestProductIsDisplayed(){
        waitForElementToPresent(element: productNameLink)
        XCTAssert(productNameLink.exists, "The cheapest product is not displayed!")
    }
    
//    func getTheCheapestProduct() {
//        let products = [29.99, 9.99, 15.99, 49.99, 7.99, 15.99]
//        
//        let cheapestProduct = products.first(where: {$0 < 49.99})
//        let stringCheapestProduct = String(cheapestProduct)
//        
//        if (safari.webViews.staticTexts[stringCheapestProduct].exists == false){
//            safari.swipeUp()
//        }
//        firstAddToCartBtn.tap()
//    }
}
