//
//  CurrencyPairCell.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class CurrencyPairCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var toCurrencyCodeWithCountry: UILabel!
    @IBOutlet weak var toCurrencyRate: UILabel!
    @IBOutlet weak var fromCurrency: UILabel!
    @IBOutlet weak var fromCurrencyCode: UILabel!
    
    // MARK: Cell Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        toCurrencyCodeWithCountry.textColor = ThemeManager.current().grey.withAlphaComponent(0.6)
        toCurrencyRate.textColor = ThemeManager.current().darkGrey
        
        fromCurrency.textColor = ThemeManager.current().grey.withAlphaComponent(0.6)
        fromCurrencyCode.textColor = ThemeManager.current().darkGrey
    }
}
