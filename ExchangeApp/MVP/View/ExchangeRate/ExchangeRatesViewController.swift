//
//  ExchangeRatesViewController.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class ExchangeRatesViewController: BaseViewController {

    internal var exchangeRates : [ExchangeRate] = [ExchangeRate]()
    internal var pairInUrl = ""
    fileprivate var timer = Timer()
    internal var presenter : ExchangeRatesPresenter = ExchangeRatesPresenter(service: ExchangeRateService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        addNavigationBarButton()
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: NSNotification.Name(Constants.kThemeChanged), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.attachView(self)
        
        fetchRates()
        validateTimer()
        
    }
    
    private func tableViewSetup(){
        tableView?.separatorStyle = .none
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: Constants.kAddCurrencyCell,
                                  bundle: nil), forCellReuseIdentifier: Constants.kAddCurrencyCell)
        tableView?.register(UINib(nibName: Constants.kCurrencyPairCell,
                                  bundle: nil), forCellReuseIdentifier: Constants.kCurrencyPairCell)
    }
    
    func addNavigationBarButton(){
        title = Constants.kTitle
        let darkMode = UIBarButtonItem.init( title: "🛸", style: .plain, target: self, action: #selector(toggleDarkMode))
        navigationItem.rightBarButtonItems = [darkMode]
    }
    
    @objc func toggleDarkMode(){
        let theme = ThemeManager.current()
        if theme == .Dark {
            ThemeManager.applyTheme(theme: .Light)
        }else{
            ThemeManager.applyTheme(theme: .Dark)
        }
        NotificationCenter.default.post(name: NSNotification.Name(Constants.kThemeChanged), object: nil)
    }
    
    @objc func changeTheme() {
        UIView.animate(withDuration: 0.9, animations: {
            self.view.backgroundColor = ThemeManager.current().background
            
            self.tableView?.reloadData()
            self.navigationController?.navigationBar.barTintColor = ThemeManager.current().fillColor
            self.navigationController?.navigationBar.tintColor =  #colorLiteral(red: 0, green: 0.5782880187, blue: 1, alpha: 1)
            self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : ThemeManager.current().darkGrey]
            self.navigationController?.navigationBar.isTranslucent = false
        }) { (done) in }
    }
    
    
    @objc func fetchRates() {
        if DataBaseManager.getCount() > 0 {
            if let exchangeRatesArray = DataBaseManager.fetch() {
                pairInUrl = ""
                for rate in exchangeRatesArray {
                    pairInUrl += Constants.kEndPoint + rate.pairs
                }

                presenter.getRates(from: Constants.kBaseUrl + pairInUrl, for: exchangeRatesArray)
                
//                NetworkManager.shared.get(from: Constants.kBaseUrl + pairInUrl) { incoming in
//
//                    guard let _incoming = incoming else {return}
//
//                    self.exchangeRates.removeAll()
//                    for i in 0..<_incoming.count {
//                        for j in 0..<_incoming.count {
//                            if exchangeRatesArray[i].pairs == Array(_incoming.keys)[j] {
//                                exchangeRatesArray[i].exchangeRate = _incoming[exchangeRatesArray[i].pairs] ?? 0.0
//                            }
//                        }
//                    }
//                    _ = exchangeRatesArray.map{self.exchangeRates.insert($0, at: 0)}
//                    DispatchQueue.main.async {
//                        self.tableView?.reloadData()
//                    }
//                }
            }
        }
    }
    
    internal func validateTimer(){
        if DataBaseManager.getCount() > 0 {
            invalidateTimer()
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(fetchRates),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    internal func invalidateTimer(){
        timer.invalidate()
    }
}

extension ExchangeRatesViewController : ExchangeRateView {
    
    func set(rates: [String : Double], with array: [ExchangeRate]) {
        var exchangeRatesArray = array
        
        self.exchangeRates.removeAll()
        for i in 0..<rates.count {
            for j in 0..<rates.count {
                if exchangeRatesArray[i].pairs == Array(rates.keys)[j] {
                    exchangeRatesArray[i].exchangeRate = rates[exchangeRatesArray[i].pairs] ?? 0.0
                }
            }
        }
        _ = exchangeRatesArray.map{self.exchangeRates.insert($0, at: 0)}
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    
    func setEmptyRates() {
    }
}
