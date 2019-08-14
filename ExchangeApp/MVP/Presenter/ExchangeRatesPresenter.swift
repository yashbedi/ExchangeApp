//
//  ExchangeRatesPresenter.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

class ExchangeRatesPresenter {
    
    // MARK: Private Properties
    
    private let service : ExchangeRateService
    weak private var view : ExchangeRateView?
    
    // MARK: Initialisers
    
    init(service: ExchangeRateService) {
        self.service = service
    }
    
    // MARK: Internal methods
    
    internal func attachView(_ view: ExchangeRateView){
        self.view = view
    }
    
    internal func detachView(){
        self.view = nil
    }
    
    internal func getRates(from url: String, for array: [ExchangeRate]) {
        
        service.getRates(from: url) { [weak self] rates in
            if rates == nil || rates?.count == 0 {
                self?.view?.setEmptyRates()
            }else{
                self?.view?.set(rates: rates!, with: array)
            }
        }
    }
    
    internal func stopRequests(){
        service.cancelRequest()
    }
}
