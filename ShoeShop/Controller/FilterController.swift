//
//  FilterController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

protocol FilterDelegate {
    func onFilterReceived(_ filter: Filter)
}

class FilterController: UIViewController {
    
    @IBOutlet weak var priceFromField: UITextField!
    
    @IBOutlet weak var priceToField: UITextField!
    
    @IBOutlet weak var brandFilterTable: UITableView!
    
    @IBOutlet weak var colorFilterTable: UITableView!
    
    var delegate: FilterDelegate?
    
    let brandTableController = BrandTableController()
    
    let colorTableController = ColorTableController()
    
    override func viewDidLoad() {
        brandFilterTable.delegate = brandTableController;
        brandFilterTable.dataSource = brandTableController;
        colorFilterTable.delegate = colorTableController;
        colorFilterTable.dataSource = colorTableController;
    }
    
    @IBAction func onFilter(_ sender: Any) {
        let priceFrom = priceFromField.text.flatMap {Double($0)} ?? 0.00
        let priceTo = priceToField.text.flatMap {Double($0)} ?? 9999.99
        
        let filter = Filter(priceFrom: priceFrom,
                      priceTo: priceTo,
                      brands: [],
                      colors: [])
        
        delegate?.onFilterReceived(filter)
    }
}
