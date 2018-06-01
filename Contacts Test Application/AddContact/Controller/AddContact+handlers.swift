//
//  AddContact+handlers.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AddContactController {
    //change placeholder
    @objc func handleSegmentSelectedItem(){
        if segmentedControl.selectedSegmentIndex == 0 {
            phoneNumberTF.placeholder = "Home phone number"
        }else{
            phoneNumberTF.placeholder = "Work phone number"
        }
    }
    //segmented
    @objc func handlePhoneTFInput(){
        if phoneNumberTF.text?.count == 0 {
            segmentedControl.isEnabled = true
        }else{
            segmentedControl.isEnabled = false
        }
    }
    //timer
    func handleTimerForInput(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(handleContactInput), userInfo: nil, repeats: true)
    }
    
    //right bar button item enbled status
    @objc func handleContactInput() {
        if firstNameTF.text?.count != 0 && phoneNumberTF.text?.count != 0 {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }else{
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    //back
    @objc func backBarButtonItem(){
        //stop timer
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
    @objc func doneMethod(){
        //stop timer
        timer?.invalidate()
        
        let contactInfo = ContactInfoController()
        //preparing and save in core data
        prepareImageForSave(image: contactImage.image!) { (Result) in
            if Result{
                //post data to next controller
                contactInfo.contact = contactModel
            }
        }
        //present
        present(UINavigationController(rootViewController: contactInfo), animated: true, completion: nil)
        
        //reset current identifier
        currentIdentifier = ""
        
    }
    
    //prepare image for save or update
    func prepareImageForSave(image: UIImage, onSuccess: @escaping(Bool)-> Void){
        guard let imageData = UIImageJPEGRepresentation(image, 0.5) else {
            print("jpg error")
            return }

        if currentIdentifier == "" {
            self.saveData(image: imageData)
        }else{
            self.updateData(image: imageData)
        }
        onSuccess(true)
    }
    
    //-----save data
    func saveData(image: Data){
        //generate id
        let identifier = IDGenerator.random(5)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let firstName = firstNameTF.text, let lastName = lastNameTF.text, let homePhoneNumber = phoneNumberTF.text, let workPhoneNumber = "" as? String, let email = emailTF.text else { return }
            //-model init

            let model = AddContactModel.init(firstName: firstName, lastName: lastName, contactImage: image, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, email: email, id: identifier)
            
            contactModel = model
            
            CoreDataManager.saveObject(firstName: firstName, lastName: lastName, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, contactImage: image, email: email, id: identifier)
        }else{
            guard let firstName = firstNameTF.text, let lastName = lastNameTF.text, let homePhoneNumber = "" as? String, let workPhoneNumber = phoneNumberTF.text, let email = emailTF.text else { return }
            //model init
            
            let model = AddContactModel.init(firstName: firstName, lastName: lastName, contactImage: image, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, email: email, id: identifier)
            
            contactModel = model
            
            CoreDataManager.saveObject(firstName: firstName, lastName: lastName, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, contactImage: image, email: email, id: identifier)
        }
    }
    //update Method
    func updateData(image: Data){
        if segmentedControl.selectedSegmentIndex == 0 {
            guard let firstName = firstNameTF.text, let lastName = lastNameTF.text, let homePhoneNumber = phoneNumberTF.text, let workPhoneNumber = "" as? String, let email = emailTF.text else { return }
            //model init
            let model = AddContactModel.init(firstName: firstName, lastName: lastName, contactImage: image, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, email: email, id: currentIdentifier)
            
            contactModel = model
            
            CoreDataManager.updateObject(firstName: firstName, lastName: lastName, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, contactImage: image, email: email)
        }else{
            guard let firstName = firstNameTF.text, let lastName = lastNameTF.text, let homePhoneNumber = "" as? String, let workPhoneNumber = phoneNumberTF.text, let email = emailTF.text else { return }
            //model init
            let model = AddContactModel.init(firstName: firstName, lastName: lastName, contactImage: image, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, email: email, id: currentIdentifier)
            
            contactModel = model
            
            CoreDataManager.updateObject(firstName: firstName, lastName: lastName, homePhoneNumber: homePhoneNumber, workPhoneNumber: workPhoneNumber, contactImage: image, email: email)
        }
    }
    
    
    //method for handle current data
    func handleCurrentContactData(){
        if currentIdentifier != "" {
            //enter current contact data
            firstNameTF.text = contact?.firstName
            lastNameTF.text = contact?.lastName
            if contact?.homePhoneNumber == "" {
                phoneNumberTF.text = contact?.workPhoneNumber
                segmentedControl.selectedSegmentIndex = 1
            }else{
                segmentedControl.selectedSegmentIndex = 0
                phoneNumberTF.text = contact?.homePhoneNumber
            }
            emailTF.text = contact?.email
            
            contactImage.image = UIImage(data: (contact?.contactImage)!)
        }
    }
    
}
