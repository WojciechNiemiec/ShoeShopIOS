//
//  Pagination.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/26/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct Pagination {
    var page: NSNumber
    var size: NSNumber
    
    func toQueryItems() -> [URLQueryItem] {
        return [
            URLQueryItem(name: "page", value: page.stringValue),
            URLQueryItem(name: "size", value: size.stringValue)
        ]
    }
}
