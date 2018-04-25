//
//  CustomModelGenerator.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/7/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation

struct MyCustomCellModelGenerator {
    let elementsCount: Int
    
    func generate() -> [CustomModel] {
        var models = [CustomModel]()
        
        for i in 0..<elementsCount {
            let tempModel = MyCustomModel(
                labelTitle: "ABCD",
                buttonTitle: "BUTTON",
                text: "Some text",
                switchValue: i % 2 == 0)
            
            models.append(tempModel)
        }
        
        return models
    }
}
