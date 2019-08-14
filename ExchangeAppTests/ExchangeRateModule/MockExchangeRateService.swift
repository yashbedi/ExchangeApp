//
//  MockExchangeRateService.swift
//  ExchangeAppTests
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

@testable import ExchangeApp

class MockExchangeRateService : ExchangeRateService {
    
    var dictionary : [String:Double]?
    
    init(pairInUrl : String?, dictionary: [String:Double]?) {
        self.dictionary = dictionary
    }
    
    override func getRates(from url : String, _ callBack : @escaping CompletionBlock){
        callBack(dictionary)
    }
    
    override func cancelRequest(){
    }
}


