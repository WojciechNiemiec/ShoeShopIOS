//
//  ShoePage.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/16/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct ShoePage: Codable {
    var content: [ShoeItem]
    var totalPages: Int
}
