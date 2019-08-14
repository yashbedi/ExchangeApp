//
//  MockSelectCurrencyService.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

@testable import ExchangeApp

class MockSelectCurrencyService : SelectCurrencyService  {
    
    var currencies : [Currency]?
    
    init(currencies : [Currency]?){
        self.currencies = currencies
    }
    
    override func setCurrencies(_ callBack : @escaping ([Currency]?)->Void){
        callBack(currencies)
    }
}
