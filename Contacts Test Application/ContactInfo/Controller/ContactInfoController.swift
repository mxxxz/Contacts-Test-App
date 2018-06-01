//
//  ContactInfoController.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class ContactInfoController: UIViewController, UITableViewDelegate {
    
    var cellsNames = ["Home:","Work:","Email:"]
    var cellsContent = [String]()
    //cell id
    let cellID = "ContactInfoCell"
    //local model
    var contact:AddContactModel? {
        didSet{
            //crear array
            cellsContent.removeAll()
            
            //image setup
            guard let data = contact?.contactImage else { return }
            let image = UIImage(data: data)
            contactImage.image = image
            //data setup
            firstNameLabel.text = contact?.firstName
            
            lastNameLabel.text = contact?.lastName
            
            //tableView Cell setup
            //home
            if contact?.homePhoneNumber == "" {cellsContent.append("No phone number")}else{cellsContent.append((contact?.homePhoneNumber)!)}
            //work
            if contact?.workPhoneNumber == ""{cellsContent.append("No phone number")}else{cellsContent.append((contact?.workPhoneNumber)!)}
            //email
            if contact?.email == ""{cellsContent.append("No email")}else{cellsContent.append((contact?.email)!)}
            //reload data
            self.tableView.reloadData()
        }
    }
    
    //views
    let contactImage: UIImageView = {
       let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = #imageLiteral(resourceName: "defaultContactImage")
        imageview.layer.cornerRadius = 40
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let firstNameLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<Contacts", style: .plain, target: self, action: #selector(backBarButtonItem))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editContactData))
        
        //add views
        view.addSubview(contactImage)
        
        view.addSubview(lastNameLabel)
        view.addSubview(firstNameLabel)
        
        view.addSubview(tableView)
        //anchors
        setupImageContainer()
        setupNameLabelsContainer()
        setupTableView()
        
        
        //register
        tableView.register(ContactInfoCell.self, forCellReuseIdentifier: cellID)
    }
}
