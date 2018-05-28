//
//  BrandTableController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/17/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class TableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var models: Array<SelectableCellModel> = []
    var cellIdentifier = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = model.value
        if model.isSelected {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if models[indexPath.row].isSelected {
            models[indexPath.row].isSelected = false
        } else {
            models[indexPath.row].isSelected = true
        }
        tableView.reloadData()
    }
    
    func getSelectedKeys() -> [String] {
        return models.filter{$0.isSelected}.map{$0.key}
    }
}
