//
//  SelectCurrencyCell.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class SelectCurrencyCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var currencyWithCountry: UILabel!
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    // MARK: Cell Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        selectedView.backgroundColor = .clear
        currencyCode.textColor = ThemeManager.current().grey.withAlphaComponent(0.6)
        currencyWithCountry.textColor = ThemeManager.current().darkGrey
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectedView.backgroundColor = .clear
        currencyCode.textColor = ThemeManager.current().grey.withAlphaComponent(0.6)
        currencyWithCountry.textColor = ThemeManager.current().darkGrey
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        selectedView.layer.cornerRadius = selectedView.frame.height / 2
        selectedView.layer.masksToBounds = true
    }
}
