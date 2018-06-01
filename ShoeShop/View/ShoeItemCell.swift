//
//  MyCustomTableViewCell.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/7/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import UIKit

class ShoeItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
