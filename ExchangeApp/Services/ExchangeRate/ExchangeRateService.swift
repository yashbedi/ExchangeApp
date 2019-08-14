//
//  ExchangeRateService.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 14/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation

class ExchangeRateService {
    
    func getRates(from url : String, _ callBack : @escaping CompletionBlock){
        
        NetworkManager.shared.get(from: url) { results in
            guard let _results = results else {return}
            callBack(_results)
        }
    }
    
    func cancelRequest(){
        NetworkManager.shared.cancelRequest()
    }
}
