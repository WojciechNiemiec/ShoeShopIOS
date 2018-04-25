//
//  MyCustomCellModelGenerator.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/18/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import Alamofire

class ItemCellModelGenerator {
    
    func generate(completion: @escaping ([ItemCellModel]) -> Void) {
        
        let request = Alamofire.request("http://shoeshop.us-east-2.elasticbeanstalk.com/shoes/find")
            .responseJSON(completionHandler: {response in
                
                DispatchQueue.global().async {
                    var models = [ItemCellModel]()
                    
                    if let shoes = response.result.value as? NSArray {
                        
                        for shoe in shoes {
                            if let _shoe = shoe as? NSDictionary {
                                let brand = _shoe["brand"] as! String
                                let model = _shoe["model"] as! String
                                let price = (_shoe["price"] as! NSNumber).stringValue
                                
                                print("brand ", brand, "model ", model, "price ", price)
                                
                                let itemCellModel = ItemCellModelImpl(
                                    name: brand + " " + model,
                                    price: price
                                )
                                
                                models.append(itemCellModel)
                            }
                            
                            completion(models)
                        }
                    }
                    
                }
            })
        
        request.resume()
    }
}
