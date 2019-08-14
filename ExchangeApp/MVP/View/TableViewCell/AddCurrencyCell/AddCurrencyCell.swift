//
//  AddCurrencyCell.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class AddCurrencyCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var addCurrencyPair: UIButton!
    @IBOutlet weak var addCurrencyButton: UIButton!
    
    // MARK: Cell Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
    }
}
