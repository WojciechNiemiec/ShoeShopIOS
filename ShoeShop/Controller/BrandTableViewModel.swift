//
//  BrandTableController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/24/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

class BrandTableViewModel: TableViewModel {
    override init() {
        super.init()
        
        cellIdentifier = "brandCellIdentifier"
        models = [SelectableCellModel(key: "ADIDAS", value: "Adidas"),
                  SelectableCellModel(key: "NIKE", value: "Nike"),
                  SelectableCellModel(key: "PUMA", value: "Puma"),
                  SelectableCellModel(key: "REEBOK", value: "Reebok"),
                  SelectableCellModel(key: "KAZAR", value: "Kazar"),
                  SelectableCellModel(key: "NEW_BALANCE", value: "New Balance")]
    }
}
