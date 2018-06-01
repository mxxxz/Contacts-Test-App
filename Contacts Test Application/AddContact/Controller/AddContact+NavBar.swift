//
//  AddContact+NavigationController.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AddContactController {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(backBarButtonItem))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneMethod))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.title = correctTitle
        navigationController?.navigationBar.barTintColor = .white
    }
}

