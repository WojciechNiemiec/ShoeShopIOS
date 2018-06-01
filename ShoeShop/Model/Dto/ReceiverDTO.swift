//
//  ReceiverDTO.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 6/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct ReceiverDTO: Codable {
    var name: String
    var surname: String
    var email: String
    var address: AddressDTO
}
