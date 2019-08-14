//
//  ExchangeRatesViewController+Ext.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

extension ExchangeRatesViewController  : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections: Int = 0
        if exchangeRates.count  > 0 {
            numOfSections            = 1
            tableView.backgroundView = nil
        }else {
            tableView.backgroundView  = attachEmtpyView()
        }
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exchangeRates.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kAddCurrencyCell, for: indexPath) as! AddCurrencyCell
            cell.addCurrencyPair.addTarget(self, action: #selector(openSelectCurrenctVC), for: .touchUpInside)
            cell.addCurrencyButton.addTarget(self, action: #selector(openSelectCurrenctVC), for: .touchUpInside)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCurrencyPairCell, for: indexPath) as! CurrencyPairCell
            let index = indexPath.row - 1
            let rate = exchangeRates[index]
            cell.fromCurrencyCode.text = "1 \(rate.fromCurrency.code)"
            cell.fromCurrency.text = "\(rate.fromCurrency.name)"
            
            cell.toCurrencyRate.text = "\(rate.exchangeRate)"
            cell.toCurrencyCodeWithCountry.text = "\(rate.toCurrency.name)\(Constants.kDot)\(rate.toCurrency.code)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 { return false }
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            invalidateTimer()
            presenter.stopRequests()
            let rate = exchangeRates[indexPath.row - 1]
            pairInUrl = pairInUrl.replacingOccurrences(of: Constants.kEndPoint + rate.pairs, with: "")
            
            _ = DataBaseManager.delete(with: exchangeRates[indexPath.row - 1].pairs)
            
            exchangeRates.remove(at: indexPath.row - 1)
            
            if exchangeRates.count < 1 {
                self.tableView?.reloadData()
                return
            }
            self.tableView?.reloadData()
            validateTimer()
        }
    }
    
    private func attachEmtpyView() -> AddCurrencyPairView{
        let emtpyView = UINib(nibName: Constants.kAddCurrencyPairView,
                              bundle: nil).instantiate(withOwner: nil, options: nil).first as! AddCurrencyPairView
        emtpyView.addCurrency.addTarget(self, action: #selector(openSelectCurrenctVC), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(openSelectCurrenctVC))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        emtpyView.addCurrencyImage.addGestureRecognizer(tap)
        return emtpyView
    }
    
    @objc fileprivate func openSelectCurrenctVC(){
        let selectCurrencyVC = SelectCurrencyViewController()
        let navigationBarVc = UINavigationController(rootViewController: selectCurrencyVC)
        DispatchQueue.main.async {
            self.present(navigationBarVc, animated: true, completion: nil)
        }
    }
}
