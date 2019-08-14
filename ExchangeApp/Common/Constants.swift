//
//  Constants.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

public typealias CompletionBlock = ([String:Double]?)->Void

struct Constants {
    static let kDot                             = "・"
    static let kSelectedTheme : String          = "SelectedTheme"
    static var kBaseUrl : String                = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?"
    static let kEndPoint : String               = "&pairs="
    static let kThemeChanged : String           = "ThemeChanged"
    static let kAddCurrencyCell : String        = "AddCurrencyCell"
    static let kCurrencyPairCell : String       = "CurrencyPairCell"
    static let kTitle : String                  = "Rates & Converter"
    static let kAddCurrencyPairView : String    = "AddCurrencyPairView"
    static let kCurrencies : String             = "currencies"
    static let kJson : String                   = "json"
    static let kName : String                   = "name"
    static let kSelectCurrencyCell : String     = "SelectCurrencyCell"
}
