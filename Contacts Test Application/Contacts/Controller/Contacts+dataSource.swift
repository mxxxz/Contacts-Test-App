//
//  Contacts+dataSource.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ContactsController {
    
    //delete cell
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //remove from core data
            CoreDataManager.deleteObject(obj: contacts[indexPath.row])
            //remove from array
            contacts.remove(at: indexPath.row)
            //reload table view
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoController = ContactInfoController()
        //selected data
        let selectedContact = contacts[indexPath.row]
        
        //init model
        let model = AddContactModel.init(firstName: selectedContact.firstName!, lastName: selectedContact.lastName!, contactImage: selectedContact.contactImage!, homePhoneNumber: selectedContact.homePhoneNumber!, workPhoneNumber: selectedContact.workPhoneNumber!, email: selectedContact.email!, id: selectedContact.id!)
        
        //post data to info controller
        infoController.contact = model
        //present
        present(UINavigationController(rootViewController: infoController), animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ContactsCell
        
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.firstName
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell.detailTextLabel?.text = contact.lastName
        return cell
    }
}
