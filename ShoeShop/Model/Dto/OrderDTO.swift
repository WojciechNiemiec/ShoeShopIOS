//
//  OrderDTO.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 6/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct OrderDTO: Codable {
    var receiver: ReceiverDTO
    var variants: Array<VariantDTO>
}
