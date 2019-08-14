//
//  Currency.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 12/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

struct Currency : Equatable {
    var code : String = ""
    var name : String = ""
}

extension Currency {
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code &&
            lhs.name == rhs.name
    }
}
