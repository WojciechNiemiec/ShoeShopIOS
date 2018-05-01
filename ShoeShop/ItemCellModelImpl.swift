//
//  ItemModelImpl.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/7/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

protocol ItemCellModel {
    var name: String { get }
    var price: String { get }
}

struct ItemCellModelImpl: ItemCellModel {
    let name: String
    let price: String
    
    init(shoeItem: ShoeItem) {
        name = shoeItem.brand + " " + shoeItem.model
        price = shoeItem.price.description
    }
}
