//
//  Core Data Manager.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    
    private class func getContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    //save
    class func saveObject(firstName: String, lastName: String, homePhoneNumber: String, workPhoneNumber: String, contactImage: Data, email: String, id: String){
        
        let entity = NSEntityDescription.entity(forEntityName: "Contact", in: getContext())
        let managedObject = NSManagedObject(entity: entity!, insertInto: getContext())
        
        managedObject.setValue(firstName, forKey: "firstName")
        managedObject.setValue(lastName, forKey: "lastName")
        managedObject.setValue(contactImage, forKey: "contactImage")
        managedObject.setValue(email, forKey: "email")
        managedObject.setValue(workPhoneNumber, forKey: "workPhoneNumber")
        managedObject.setValue(homePhoneNumber, forKey: "homePhoneNumber")
        
        //id
        
        managedObject.setValue(id, forKey: "id")

        
        do{
            try getContext().save()
        }catch{
            print("Can't save object")
        }
    }
    
    
    //fetch
    class func fetchObject(onSuccess: @escaping(Bool) -> Void) {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        do {
            contacts = try getContext().fetch(fetchRequest)
            onSuccess(true)
        }catch{
            onSuccess(false)
            print("Can't fetch object")
            
        }
    }
    
    class func updateObject(firstName: String, lastName: String, homePhoneNumber: String, workPhoneNumber: String, contactImage: Data, email: String) {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        do
        {
            let results = try getContext().fetch(fetchRequest)
            if results.count > 0
            {
                for result in results as [NSManagedObject] {
                    if let id = result.value(forKey: "id") as? String {
                        if id == currentIdentifier {
                            result.setValue(firstName, forKey: "firstName")
                            result.setValue(lastName, forKey: "lastName")
                            result.setValue(contactImage, forKey: "contactImage")
                            result.setValue(email, forKey: "email")
                            result.setValue(workPhoneNumber, forKey: "workPhoneNumber")
                            result.setValue(homePhoneNumber, forKey: "homePhoneNumber")
                            do{
                                try getContext().save()
                            }catch{
                                print("Can't update data")
                            }
                        }
                    }
                }
            }
        }
        catch
        {
            print(error)
        }
    }
    
    //delete single contact
    class func deleteObject(obj: NSManagedObject){
        getContext().delete(obj)
        do{
            try getContext().save()
            
        }catch{
            print("Can't delete contact from Core Data")
        }
    }
}
