//
//  MyCustomCellModelGenerator.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/18/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

class ItemCellModelGenerator {
    func generate(quantity: Int) -> [ItemCellModel] {
        
        var itemCells = [ItemCellModel]()
        
        for i in 1...quantity {
            let itemCellModel = ItemCellModelImpl(
                name: "Product no. " + i.description,
                price: (i * 100).description
            )
            
            itemCells.append(itemCellModel)
        }
        
        return itemCells
    }
}
