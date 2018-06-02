//
//  CartTableViewModel.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 6/1/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import Foundation
import UIKit

class CartTableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "cartCellIdentifier"
    
    var items: [SizedShoeItem]
    
    init(items: [SizedShoeItem]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CartItemCell
        
        let item = items[indexPath.row]
        let shoe = item.shoe
        
        cell.shoeTitleLabel.text = shoe.brand.appending(" ").appending(shoe.model)
        cell.colorLabel.text = shoe.soleColor.appending(" / ").appending(shoe.shankColor)
        cell.sizeLabel.text = item.size.description
        cell.priceLabel.text = shoe.price.description
        
        return cell
    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let height = self.tableView(tableView, cellForRowAt: indexPath).contentView.frame.height
//        return height > 0 ? height : 0
//    }
}
