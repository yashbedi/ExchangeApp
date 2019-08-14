//
//  AddCurrencyPairView.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class AddCurrencyPairView: UIView {

    @IBOutlet weak var addCurrencyImage: UIImageView!
    @IBOutlet weak var addCurrency: UIButton!
    @IBOutlet weak var chooseCurrenctLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chooseCurrenctLabel.textColor = ThemeManager.current().grey.withAlphaComponent(0.6)
        addCurrency.setTitleColor(Theme.brandColor, for: .normal)
    }
}
