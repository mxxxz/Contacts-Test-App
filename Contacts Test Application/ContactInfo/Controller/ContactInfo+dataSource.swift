//
//  ContactInfo+dataSource.swift
//  Contacts Test Application
//
//  Created by Dmitry Grusha on 01.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ContactInfoController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ContactInfoCell
        //style
        cell.selectionStyle = .none
        
        //name
        let cellName = cellsNames[indexPath.row]
        cell.cellName.text = cellName
        //content
        let content = cellsContent[indexPath.row]
        
        cell.contentLabel.text = content
        return cell
    }
    
}
