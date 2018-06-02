//
//  Cart.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 6/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

class Cart {
    var shoes = [SizedShoeItem]()
    
    func add(shoe: ShoeItem, size: Int) {
        shoes.append(SizedShoeItem(shoe: shoe, size: size))
    }
}
