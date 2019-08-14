//
//  SelectCurrencyPresenter.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

class SelectCurrencyPresenter {
    
    // MARK: Private Properties
    
    private let service : SelectCurrencyService
    weak private var view : SelectCurrencyView?
    
    // MARK: Initialisers
    
    init(service: SelectCurrencyService) {
        self.service = service
    }
    
    // MARK: Internal methods
    
    internal func attachView(_ view: SelectCurrencyView){
        self.view = view
    }
    
    internal func detachView(){
        self.view = nil
    }
    
    internal func getCurrencies(){
        
        service.setCurrencies { [weak self] currencies in
            if currencies == nil || currencies?.count == 0 {
                self?.view?.setEmptyCurrencies()
            }else {
                self?.view?.set(currencies: currencies)
            }
        }
    }
}
