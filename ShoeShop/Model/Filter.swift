//
//  Filter.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/21/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct Filter: Codable {
    var priceFrom: Double
    var priceTo: Double
    var brands: Array<String>
    var shankColors: Array<String>
}
