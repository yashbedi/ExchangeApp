//
//  SelectCurrencyService.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

class SelectCurrencyService {
    
    func setCurrencies(_ callBack : @escaping ([Currency]?)->Void){
        var currencies = [Currency]()
        
        if let path = Bundle.main.path(forResource: Constants.kCurrencies, ofType: Constants.kJson) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let dictionary = jsonResult as? [String:[String:String]] {
                    
                    for (_,element) in dictionary.enumerated() {
                        let currency = Currency(code: element.key, name:
                            element.value[Constants.kName] ?? "")
                        currencies.append(currency)
                    }
                }
            } catch let e {
                print(e.localizedDescription)
            }
        }
        currencies = currencies.sorted { $0.code < $1.code }
        callBack(currencies)
    }
}
