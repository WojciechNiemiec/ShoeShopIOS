//
//  BrandTableController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/17/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class ColorTableController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var brands: Array<SelectableCellModel> = [SelectableCellModel(key: "BLACK", value: "Black"),
                                              SelectableCellModel(key: "WHITE", value: "White"),
                                              SelectableCellModel(key: "RED", value: "Red"),
                                              SelectableCellModel(key: "GREEN", value: "Green"),
                                              SelectableCellModel(key: "BLUE", value: "Blue"),
                                              SelectableCellModel(key: "YELLOW", value: "Yellow")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brand = brands[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCellIdentifier", for: indexPath)
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
