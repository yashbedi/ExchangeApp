//
//  MockSelectCurrencyView.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

@testable import ExchangeApp


class MockSelectCurrencyView : NSObject, SelectCurrencyView {
    
    var setCurrenciesCalled = false
    var setEmptyCurrenciesCalled = false
    
    func set(currencies: [Currency]?) {
        setCurrenciesCalled = true
    }
    
    func setEmptyCurrencies(){
        setEmptyCurrenciesCalled = true
    }
}
