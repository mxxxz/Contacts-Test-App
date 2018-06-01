//
//  ContactsController.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
//array with all created contacts
var contacts = [Contact]()

class ContactsController: UITableViewController {
    //cell identifier
    let cellID = "ContactsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nav bar setup
        setupNavigationBar()
        //fetch objects from core data
        inspectionFetch()
        //register
        tableView.register(ContactsCell.self, forCellReuseIdentifier: cellID)
    }
}
