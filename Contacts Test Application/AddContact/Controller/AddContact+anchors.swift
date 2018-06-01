//
//  AddContact+anchors.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

extension AddContactController {
    //setup for image container
    func setupContactImageContainer(){
        //image
        contactImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        contactImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //image button
        imageButton.topAnchor.constraint(equalTo: contactImage.topAnchor).isActive = true
        imageButton.leftAnchor.constraint(equalTo: contactImage.leftAnchor).isActive = true
        imageButton.rightAnchor.constraint(equalTo: contactImage.rightAnchor).isActive = true
        imageButton.bottomAnchor.constraint(equalTo: contactImage.bottomAnchor).isActive = true
    }
    //setup for names container
    func setupNamesTFContainer(){
        //first name tf
        firstNameTF.topAnchor.constraint(equalTo: contactImage.topAnchor).isActive = true
        firstNameTF.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 20).isActive = true
        firstNameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        firstNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //separator
        separator.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 10).isActive = true
        separator.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separator.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        //last name tf
        lastNameTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: 0.5).isActive = true
        lastNameTF.leftAnchor.constraint(equalTo: firstNameTF.leftAnchor).isActive = true
        lastNameTF.rightAnchor.constraint(equalTo: firstNameTF.rightAnchor).isActive = true
        lastNameTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //separator
        separator1.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 10).isActive = true
        separator1.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separator1.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor).isActive = true
        separator1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    //setup for phone number container
    func setupPhoneContainer(){
        //label
        addPhoneNumberLabel.leftAnchor.constraint(equalTo: contactImage.leftAnchor, constant: 25).isActive = true
        addPhoneNumberLabel.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 20).isActive = true
        addPhoneNumberLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addPhoneNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //separator
        separator2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        separator2.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separator2.topAnchor.constraint(equalTo: addPhoneNumberLabel.bottomAnchor, constant: 10).isActive = true
        separator2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        //segmented control
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 10).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //phone tf
        phoneNumberTF.leftAnchor.constraint(equalTo: addPhoneNumberLabel.leftAnchor, constant: 0).isActive = true
        phoneNumberTF.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5).isActive = true
        phoneNumberTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        phoneNumberTF.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    //setup for email container
    func setupEmailContainer(){
        //label
        addEmail.leftAnchor.constraint(equalTo: contactImage.leftAnchor, constant: 25).isActive = true
        addEmail.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 40).isActive = true
        addEmail.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        addEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //separator
        separator3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        separator3.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separator3.topAnchor.constraint(equalTo: addEmail.bottomAnchor, constant: 10).isActive = true
        separator3.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        //email tf
        emailTF.leftAnchor.constraint(equalTo: addEmail.leftAnchor).isActive = true
        emailTF.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: 10).isActive = true
        emailTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
