//
//  ShoeViewController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/24/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class ShoeViewController: UIViewController {
    
    var shoe: ShoeItem?
    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sizePicker: UIPickerView!
    
    override func viewDidLoad() {
        if let shoe = shoe {
            titleLabel.text = shoe.brand.appending(" ").appending(shoe.model)
            priceLabel.text = shoe.price.description
            typeLabel.text = shoe.shoeType
            genderLabel.text = shoe.gender
            descriptionLabel.text = shoe.description
            imageView.image = image
        }
        
//        sizePicker.
    }
    
    @IBAction func addToCart(_ sender: Any) {
        
    }
}
