//
//  ExchangeRate.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 12/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation


struct ExchangeRate : Equatable {
    var fromCurrency : Currency
    var toCurrency  : Currency
    var exchangeRate : Double
    var pairs: String
}
