//
//  DatabaseManager.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 13/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit
import CoreData

final class DataBaseManager : NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    public class func saveObject(of type : ExchangeRate) -> Bool {
        let context = DataBaseManager.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ExchangeRateModel", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(type.exchangeRate, forKey: "exchangeRate")
        managedObject.setValue(type.fromCurrency.code, forKey: "fromCurrencyCode")
        managedObject.setValue(type.fromCurrency.name, forKey: "fromCurrencyName")
        
        managedObject.setValue(type.toCurrency.code, forKey: "toCurrencyCode")
        managedObject.setValue(type.toCurrency.name  , forKey: "toCurrencyName")
        
        managedObject.setValue(type.pairs, forKey: "pairs")
        
        managedObject.setValue(type.exchangeRate, forKey: "exchangeRate")
        
        do {
            try context.save()
            return true
        } catch let e {
            print(e.localizedDescription)
            return false
        }
    }
    
    public class func fetch() -> [ExchangeRate]? {
        let context = DataBaseManager.getContext()
        var exchangeRates : [ExchangeRate]? = nil
        
        do {
            let exchangeRateModels = try context.fetch(ExchangeRateModel.fetchRequest())

            exchangeRates = [ExchangeRate]()

            for rate in exchangeRateModels {
                if let managedObject = rate as? NSManagedObject {
                    guard
                    let fromCurrencyCode = managedObject.value(forKey: "fromCurrencyCode") as? String,
                    let fromCurrencyName = managedObject.value(forKey: "fromCurrencyName") as? String,
                    let toCurrencyCode = managedObject.value(forKey: "toCurrencyCode") as? String,
                    let toCurrencyName = managedObject.value(forKey: "toCurrencyName") as? String,
                    let pairs = managedObject.value(forKey: "pairs") as? String,
                    let _rate = managedObject.value(forKey: "exchangeRate") as? Double
                    else { return exchangeRates }
                    
                    let exchangeRate = ExchangeRate(
                        fromCurrency: Currency(code: fromCurrencyCode, name: fromCurrencyName),
                        toCurrency: Currency(code: toCurrencyCode, name: toCurrencyName),
                        exchangeRate: _rate,
                        pairs: pairs)
                    
                    exchangeRates?.append(exchangeRate)
                }
            }
            return exchangeRates
        }catch let e {
            print(e.localizedDescription)
            return exchangeRates
        }
    }
    
    public class func getCount() -> Int {
        var count = 0
        let context = DataBaseManager.getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExchangeRateModel")
        do {
            count = try context.count(for: fetchRequest)
        } catch let e {
            print(e.localizedDescription)
        }
        return count
    }
    
    public class func delete(with pairs: String) -> Bool {
        let context = DataBaseManager.getContext()
        do  {
            let exchangeRateModels = try context.fetch(ExchangeRateModel.fetchRequest())
            for rate in exchangeRateModels {
                if let managedObject = rate as? NSManagedObject {
                    if let _pairs = managedObject.value(forKey: "pairs") as? String {
                        if _pairs == pairs{
                            context.delete(managedObject)
                            break
                        }
                    }
                }
            }
            try context.save()
            return true
        }catch let e {
            print(e.localizedDescription)
            return false
        }
    }
}
