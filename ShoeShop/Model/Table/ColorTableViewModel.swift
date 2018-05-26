//
//  BrandTableController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/17/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

class ColorTableViewModel: TableViewModel {
    override init() {
        super.init()
        
        cellIdentifier = "colorCellIdentifier"
        models = [SelectableCellModel(key: "BLACK", value: "Black"),
                 SelectableCellModel(key: "WHITE", value: "White"),
                 SelectableCellModel(key: "RED", value: "Red"),
                 SelectableCellModel(key: "GREEN", value: "Green"),
                 SelectableCellModel(key: "BLUE", value: "Blue"),
                 SelectableCellModel(key: "YELLOW", value: "Yellow"),
                 SelectableCellModel(key: "ORANGE", value: "Orange")]
    }
}
