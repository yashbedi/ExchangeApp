//
//  Double+Extension.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 13/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}
