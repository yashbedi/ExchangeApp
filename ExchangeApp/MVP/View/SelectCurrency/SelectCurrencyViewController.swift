//
//  SelectCurrencyViewController.swift
//  ExchangeApp
//
//  Created by Yash Bedi on 11/08/19.
//  Copyright © 2019 Yash Bedi. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: BaseViewController {
    
    internal var currency : [Currency] = [Currency]()
    internal var selectedCurency : Currency?
    internal var selectedIndexPath: IndexPath?
    internal var presenter : SelectCurrencyPresenter = SelectCurrencyPresenter(service: SelectCurrencyService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        addingNavBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.attachView(self)
        presenter.getCurrencies()
    }
    
    func addingNavBarButtons(){
        let leftButton = UIBarButtonItem.init( barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func tableViewSetup(){
//        tableView?.allowsMultipleSelection = true
//        tableView?.allowsMultipleSelectionDuringEditing = true
        tableView?.separatorStyle = .none
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UINib(nibName: Constants.kSelectCurrencyCell,
                                  bundle: nil), forCellReuseIdentifier: Constants.kSelectCurrencyCell)
    }
}



extension SelectCurrencyViewController : SelectCurrencyView {
    func set(currencies: [Currency]?) {
        self.currency = currencies ?? [Currency]()
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}
