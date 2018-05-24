//
//  ShoeItem.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/26/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct ShoeItem: Codable {
    var id: Int
    var variantId: Int
    var brand: String
    var model: String
    var price: Double
    var shoeType: String
    var gender: String
    var description: String
}
