//
//  ContactInfo+handlers.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ContactInfoController {
    
    @objc func backBarButtonItem(){
        let contactsController = ContactsController()
        present(UINavigationController(rootViewController:contactsController), animated: false, completion: nil)
    }
    
    //edit data
    @objc func editContactData(){
        let addContact = AddContactController()
        //post current contact data
        addContact.contact = contact
        //post current id
        currentIdentifier = (contact?.id)!
        //correct nav bar title
        correctTitle = "Edit contact"
        //present
        present(UINavigationController(rootViewController: addContact), animated: true, completion: nil)
    }
}
