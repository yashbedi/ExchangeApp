//
//  SelectCurrencyView.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

protocol SelectCurrencyView : NSObjectProtocol {
    func set(currencies : [Currency]?)
    func setEmptyCurrencies()
}

extension SelectCurrencyView {
    func set(currencies : [ExchangeRate]?) {}
    func setEmptyCurrencies() {}
}
