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
    
    @IBOutlet weak var colorFilterTable: UITableView!
    
    let brandTableController = BrandTableController()
    
    let colorTableController = ColorTableController()
    
    override func viewDidLoad() {
        brandFilterTable.delegate = brandTableController;
        brandFilterTable.dataSource = brandTableController;
        colorFilterTable.delegate = colorTableController;
        colorFilterTable.dataSource = colorTableController;
    }
}
