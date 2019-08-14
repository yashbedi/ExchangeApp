//
//  NetworkManager.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 12/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import Foundation


class NetworkManager {
    
    private init() { }
    
    static let shared = NetworkManager()
    
    private var task : URLSessionDataTask?
    
    // MARK: GET Exchange Rates From Backend
    
    internal func get(from url: String ,callBack: @escaping CompletionBlock) {
        guard let _url = URL(string: url) else {return}
        
        let request = URLRequest(url: _url)
        
         task = URLSession.shared.dataTask(with: request){ data, response, errory -> Void in
            
            guard let _data = data else { callBack(nil); return }
            do {
                guard
                let result = try JSONSerialization.jsonObject(with: _data) as? [String:Double] else { callBack(nil); return }
                callBack(result)
            } catch let error {
                print(error.localizedDescription)
                callBack(nil)
            }
            
        }
        task?.resume()
    }
    
    // MARK: Stop Api Calls.
    
    internal func cancelRequest(){
        self.task?.cancel()
    }
}
