//
//  ContactInfo+anchors.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation
extension ContactInfoController {
    //setup for image container
    func setupImageContainer(){
        contactImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contactImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    //setup for names container
    func setupNameLabelsContainer() {
        lastNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lastNameLabel.topAnchor.constraint(equalTo: contactImage.bottomAnchor, constant: 20).isActive = true
        lastNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        firstNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 5).isActive = true
        firstNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        firstNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }
    //setup for table view container
    func setupTableView(){
        tableView.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
