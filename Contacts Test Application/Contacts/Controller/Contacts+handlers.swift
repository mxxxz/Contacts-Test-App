//
//  Contacts+handlers.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ContactsController {
    //reload table view
    func reloadTableView(){
        tableView.reloadData()
    }
    //call reload after fetch object
    func inspectionFetch(){
        CoreDataManager.fetchObject { (Result) in
            if Result{
                self.reloadTableView()
            }
        }
    }
    //present
    @objc func presentAddContactController(){
        let addController = AddContactController()
        correctTitle = "Add Contact"
        present(UINavigationController(rootViewController: addController), animated: true, completion: nil)
    }
}
