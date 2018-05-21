//
//  SelectableCellModel.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/17/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct SelectableCellModel {
    var key: String
    var value: String
    var isSelected: Bool
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
        self.isSelected = false
    }
}
