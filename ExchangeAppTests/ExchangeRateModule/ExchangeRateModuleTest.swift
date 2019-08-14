//
//  ExchangeRateModuleTest.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import XCTest

@testable import ExchangeApp

class ExchangeRateModuleTest: XCTestCase {

    var serviceMock = MockExchangeRateService(pairInUrl: "&pairs=INRAUD&pairs=GBPUSD", dictionary:
        ["INRAUD" : 0.0194, "GBPUSD" : 1.2944])
    
    var emptyServiceMock = MockExchangeRateService(pairInUrl: nil, dictionary: nil)
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testShouldSetRates(){
        let mockView = MockExchangeRateView()
        let presenterInTest = ExchangeRatesPresenter(service: serviceMock)
        
        presenterInTest.attachView(mockView)
        let exchange1 = ExchangeRate(fromCurrency:
            Currency(code: "INR", name: "Indian Rupee"),
                                    toCurrency:
            Currency(code: "AUD", name: "Australian Dollar"), exchangeRate:  0.0194, pairs: "INRAUD")
        
        let exchange2 = ExchangeRate(fromCurrency:
            Currency(code: "GBP", name: "British Pound"),
                                     toCurrency:
            Currency(code: "USD", name: "US Dollar"), exchangeRate:  1.2944, pairs: "GBPUSD")
        
        
        presenterInTest.getRates(from: "&pairs=INRAUD&pairs=GBPUSD", for: [exchange1,exchange2])
        
        XCTAssertTrue(mockView.setRatesCalled)
    }
    
    func testShouldSetEmptyRates(){
        let mockView = MockExchangeRateView()
        let presenterInTest = ExchangeRatesPresenter(service: emptyServiceMock)
        
        presenterInTest.attachView(mockView)
        let exchange = ExchangeRate(fromCurrency:
            Currency(code: "", name: ""),
                                     toCurrency:
            Currency(code: "", name: ""), exchangeRate:  0.0, pairs: "I")
        
        presenterInTest.getRates(from: "", for: [exchange])
        
        XCTAssertTrue(mockView.setEmptyRatesCalled)
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
