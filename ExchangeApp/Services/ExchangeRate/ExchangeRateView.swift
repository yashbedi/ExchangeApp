//
//  ExchangeRateView.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

protocol ExchangeRateView : NSObjectProtocol {
    func set(rates : [String:Double], with array: [ExchangeRate])
    func setEmptyRates()
}

extension ExchangeRateView {
    func set(rates : [String:Double], with array: [ExchangeRate]) {}
    func setEmptyRates() {}
}
