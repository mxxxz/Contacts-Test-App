//
//  AddContactController.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
class AddContactController: UIViewController {
    
    var contact: AddContactModel?
    
    
    //timer
    var timer:Timer?
    
    // --------- views
    //image
    let contactImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "defaultContactImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        
        return imageView
    }()
    let imageButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleImagePicker), for: .touchUpInside)
        return button
    }()
    //names
    let firstNameTF:UITextField = {
       let tf = UITextField()
        tf.placeholder = "First name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    let lastNameTF:UITextField = {
        let tf = UITextField()
        tf.placeholder = "Last name(Optional)"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    let separator1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    //phone
    let addPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add phone number"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let separator2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Home", "Work"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 0
        
        sc.addTarget(self, action: #selector(handleSegmentSelectedItem), for: .valueChanged)
        return sc
    }()
    
    let phoneNumberTF: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Home phone number"
        
        tf.addTarget(self, action: #selector(handlePhoneTFInput), for: .editingChanged)
        tf.keyboardType = .numberPad
        return tf
    }()
    
    //email
    let addEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add e-mail(optional)"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    let separator3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    let emailTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email"
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    //--------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        //navbar setup
        setupNavigationBar()
        
        //add subviews
        view.addSubview(contactImage)
        view.addSubview(imageButton)
        
        view.addSubview(firstNameTF)
        view.addSubview(separator)
        view.addSubview(lastNameTF)
        view.addSubview(separator1)
        
        view.addSubview(addPhoneNumberLabel)
        view.addSubview(separator2)
        view.addSubview(segmentedControl)
        view.addSubview(phoneNumberTF)
        
        view.addSubview(addEmail)
        view.addSubview(separator3)
        view.addSubview(emailTF)
        //anchors
        setupContactImageContainer()
        setupNamesTFContainer()
        setupPhoneContainer()
        setupEmailContainer()
        //timer for inspection
        handleTimerForInput()
        
        //handleCurrentContactData
        handleCurrentContactData()
        
    }
}
