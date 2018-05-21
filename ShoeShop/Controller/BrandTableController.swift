//
//  BrandTableController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/17/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class BrandTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var brands: Array<SelectableCellModel> = [SelectableCellModel(key: "ADIDAS", value: "Adidas"),
                                              SelectableCellModel(key: "NEW_BALANCE", value: "New Balance"),
                                              SelectableCellModel(key: "REBOOK", value: "Rebook"),
                                              SelectableCellModel(key: "PUMA", value: "Puma"),
                                              SelectableCellModel(key: "KAZAR", value: "Kazar")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brand = brands[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCellIdentifier", for: indexPath)
        cell.textLabel?.text = brand.value
        if brand.isSelected {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if brands[indexPath.row].isSelected {
            brands[indexPath.row].isSelected = false
        } else {
            brands[indexPath.row].isSelected = true
        }
        DispatchQueue.main.async {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
