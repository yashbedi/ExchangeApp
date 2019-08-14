//
//  Theme.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 07/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

public let SelectedThemeKey = Constants.kSelectedTheme

enum Theme : Int {
    
    case Light
    case Dark
    
    static let brandColor : UIColor = #colorLiteral(red: 0.003767747432, green: 0.4580058455, blue: 0.9193190336, alpha: 1)
    
    var background : UIColor {
        switch self {
        case .Light     : return .white
        case .Dark      : return #colorLiteral(red: 0.2391854823, green: 0.2392330766, blue: 0.2391824722, alpha: 1)
        }
    }
    
    var darkGrey: UIColor {
        switch self {
        case .Light     : return #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
        case .Dark      : return #colorLiteral(red: 0.866572082, green: 0.8667211533, blue: 0.8665626645, alpha: 1)
        }
    }
    
    var grey: UIColor {
        switch self {
        case .Light     : return #colorLiteral(red: 0.4666131139, green: 0.4666974545, blue: 0.4666077495, alpha: 1)
        case .Dark      : return #colorLiteral(red: 0.866572082, green: 0.8667211533, blue: 0.8665626645, alpha: 1)
        }
    }
    
    var fillColor : UIColor {
        switch self {
        case .Light     : return #colorLiteral(red: 0.9998916984, green: 1, blue: 0.9998809695, alpha: 1)
        case .Dark      : return #colorLiteral(red: 0.1646832824, green: 0.1647188365, blue: 0.1646810472, alpha: 1)
        }
    }
}


class ThemeManager {
    
    static func current() -> Theme {
        if let storedTheme = UserDefaults.standard.value(forKey: SelectedThemeKey) as? Int {
            return Theme(rawValue: storedTheme)!
        }else{
            return .Light
        }
    }
    
    static func applyTheme(theme : Theme){
        UserDefaults.standard.set(theme.rawValue, forKey: SelectedThemeKey)
        
        UINavigationBar.appearance().barTintColor = theme.fillColor
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.5782880187, blue: 1, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : theme.darkGrey]
        UINavigationBar.appearance().isTranslucent = false
    }
}
