//
//  AddContactModel.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class AddContactModel {
    var firstName: String
    var lastName: String?
    var contactImage: Data
    var homePhoneNumber: String?
    var workPhoneNumber: String?
    var email: String?
    var id: String
    
    required init(firstName: String, lastName: String, contactImage: Data, homePhoneNumber: String, workPhoneNumber: String, email: String, id: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.contactImage = contactImage
        self.homePhoneNumber = homePhoneNumber
        self.workPhoneNumber = workPhoneNumber
        self.email = email
        self.id = id
    }
}
