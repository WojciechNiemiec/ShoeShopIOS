//
//  AddressDTO.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 6/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct AddressDTO: Codable {
    var postalCode: String
    var city: String
    var street: String
    var flatNumber: Int
    var localeNumber: Int?
}
