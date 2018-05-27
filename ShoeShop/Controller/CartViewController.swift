//
//  CartViewController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/24/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func hide(_ sender: Any) {
        picker.isHidden = !picker.isHidden
    }
}
