//
//  ItemModelImpl.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/7/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

protocol ItemCellModel: Equatable {
    var variantId: Int { get }
    var name: String { get }
    var price: String { get }
    var image: UIImage { get set }
}

class ItemCellModelImpl: ItemCellModel {
    let variantId: Int
    let name: String
    let price: String
    var image: UIImage
    
    init(shoeItem: ShoeItem) {
        variantId = shoeItem.variantId
        name = shoeItem.brand + " " + shoeItem.model
        price = shoeItem.price.description
        image = UIImage()
    }
    
    static func == (lhs: ItemCellModelImpl, rhs: ItemCellModelImpl) -> Bool {
        return lhs.variantId == rhs.variantId
    }
}
