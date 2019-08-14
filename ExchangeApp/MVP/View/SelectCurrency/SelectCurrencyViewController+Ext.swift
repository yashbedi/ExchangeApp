//
//  SelectCurrencyViewController+Ext.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit


extension SelectCurrencyViewController  : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kSelectCurrencyCell,
                                                 for: indexPath) as! SelectCurrencyCell
        let currencyObject = currency[indexPath.row]
        cell.countryImageView.image = UIImage(named: "\(currencyObject.code)")
        cell.currencyCode.text = currencyObject.code
        cell.currencyWithCountry.text = currencyObject.name
        
        guard let selectedIndex = selectedIndexPath else{ return cell}
        
        if selectedIndex.row == indexPath.row {
            cell.selectedView.backgroundColor = Theme.brandColor
            cell.currencyCode.textColor = UIColor.white.withAlphaComponent(0.7)
            cell.currencyWithCountry.textColor = .white
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedIndexPath == indexPath {
            // when tapping on pre-selected cell, from previous viewcontroller
        }else{
            if selectedIndexPath == nil && selectedCurency == nil {
                selectedCurency = currency[indexPath.row]
                selectedIndexPath = indexPath
                
                let currencySelecVC = SelectCurrencyViewController()
                currencySelecVC.selectedCurency = currency[indexPath.row]
                currencySelecVC.selectedIndexPath = indexPath
                
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(currencySelecVC, animated: true)
                }
            }else{
                savingaData(from: selectedCurency!, to: currency[indexPath.row])
                DispatchQueue.main.async {
                    self.dismissVC()
                }
            }
        }
    }
    
    fileprivate func savingaData(from: Currency, to : Currency){
        
        let exchangeRateObj = ExchangeRate(fromCurrency: from,
                                           toCurrency: to,
                                           exchangeRate: 0.0,
                                           pairs: from.code + to.code)
        
        guard let storedObject = DataBaseManager.fetch() , storedObject.count > 0 else{
            _ = DataBaseManager.saveObject(of: exchangeRateObj)
            return
        }
        
        // Check : Not to store Duplicate object
        
        for i in 0..<storedObject.count {
            if storedObject[i] == exchangeRateObj || storedObject[i].pairs == exchangeRateObj.pairs{
                // do not store object
                return
            }
        }
        _ = DataBaseManager.saveObject(of: exchangeRateObj)
    }
}
