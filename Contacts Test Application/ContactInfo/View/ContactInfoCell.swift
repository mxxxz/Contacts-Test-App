//
//  ContactInfoCell.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class ContactInfoCell: UITableViewCell {
    let cellName:UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let contentLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(cellName)
        addSubview(contentLabel)
        
        //ios 9 constraints
        cellName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        cellName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        cellName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        cellName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentLabel.leftAnchor.constraint(equalTo: cellName.leftAnchor).isActive = true
        contentLabel.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 5).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        contentLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
