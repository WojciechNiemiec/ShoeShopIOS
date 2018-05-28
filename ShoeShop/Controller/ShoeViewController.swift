//
//  ShoeViewController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/24/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class ShoeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var sizes = Array<SizeDTO>()
    var shoe: ShoeItem?
    var image: UIImage?
    
    var addToCartSegue = "addToCartSegue"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var chooseSizeButton: UIButton!
    @IBOutlet weak var sizePicker: UIPickerView!
    
    override func viewDidLoad() {
        if let shoe = shoe {
            titleLabel.text = shoe.brand.appending(" ").appending(shoe.model)
            priceLabel.text = shoe.price.description
            typeLabel.text = shoe.shoeType
            genderLabel.text = shoe.gender
            descriptionLabel.text = shoe.description
            imageView.image = image
            sizePicker.delegate = self
            sizePicker.dataSource = self

            WebServiceClient().getSizes(for: shoe.variantId, completion: { sizes in
                self.sizes.append(contentsOf: sizes)
                DispatchQueue.main.async {
                    self.sizePicker.reloadAllComponents()
                }
            })
        }
    }
    
    @IBAction func chooseSize(_ sender: Any) {
        sizePicker.isHidden = !sizePicker.isHidden
        
        if sizePicker.isHidden {
            chooseSizeButton.setTitle("Choose Size", for: .normal)
        } else {
            chooseSizeButton.setTitle("Done", for: .normal)
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        if let size = sizeLabel.text {
            if size == "unspecified" {
                sizeLabel.textColor = UIColor.red
            } else {
                performSegue(withIdentifier: addToCartSegue, sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == addToCartSegue {
            
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizes[row].size.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeLabel.text = sizes[row].size.description
        sizeLabel.textColor = UIColor.black
        sizeLabel.setNeedsDisplay()
    }
}
