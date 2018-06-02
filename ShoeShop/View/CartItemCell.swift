//
//  CartItemCell.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 5/24/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {

    
    @IBOutlet weak var shoeTitleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
