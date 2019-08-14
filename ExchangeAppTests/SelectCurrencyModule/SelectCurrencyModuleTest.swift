//
//  SelectCurrencyModuleTest.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import XCTest

@testable import ExchangeApp

class SelectCurrencyModuleTest: XCTestCase {

    var serviceMock = MockSelectCurrencyService(currencies: [
        Currency(code: "INR", name: "Indian Rupee"),
        Currency(code: "GBP", name: "British Pound")
        ])
    
    var emptyServiceMock = MockSelectCurrencyService(currencies: nil)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testShouldSetCurrencies(){
        let mockView = MockSelectCurrencyView()
        let presenterInTest = SelectCurrencyPresenter(service: serviceMock)
        
        presenterInTest.attachView(mockView)
        
        presenterInTest.getCurrencies()
        
        XCTAssertTrue(mockView.setCurrenciesCalled)
    }
    
    func testShouldSetEmptyCurrencies(){
        let mockView = MockSelectCurrencyView()
        let presenterInTest = SelectCurrencyPresenter(service: emptyServiceMock)
        
        presenterInTest.attachView(mockView)
        
        presenterInTest.getCurrencies()
        
        XCTAssertTrue(mockView.setEmptyCurrenciesCalled)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
