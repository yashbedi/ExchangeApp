//
//  MockExchangeRateView.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

@testable import ExchangeApp

class MockExchangeRateView : NSObject, ExchangeRateView {
    
    var setRatesCalled = false
    var setEmptyRatesCalled = false
    
    func set(rates : [String:Double], with array: [ExchangeRate]) {
        setRatesCalled = true
    }
    
    func setEmptyRates() {
        setEmptyRatesCalled = true
    }
}

