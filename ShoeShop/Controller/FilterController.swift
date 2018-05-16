//
//  FilterController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class FilterController: UIViewController {
    
    @IBOutlet weak var priceFromField: UITextField!
    
    @IBOutlet weak var priceToField: UITextField!
    
    @IBOutlet weak var brandFilterTable: UITableView!
    
    @IBOutlet weak var ColorFilterTable: UITableView!
    
    let brands = ["NIKE", "REEBOOK"]
    
    override func viewDidLoad() {
        let brands = ["NIKE": "Nike", "NEW_BALANCE": "New Balance"]
        brandFilterTable.setValuesForKeys(brands)
        brandFilterTable.reloadData()
    }
}
