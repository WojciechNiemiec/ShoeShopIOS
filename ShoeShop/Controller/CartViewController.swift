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
    
    var cart: Cart!
    let cellIdentifier = "cartCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var postalCodeLabel: UITextField!
    @IBOutlet weak var streetLabel: UITextField!
    @IBOutlet weak var houseLabel: UITextField!
    @IBOutlet weak var flatLabel: UITextField!
    
    override func viewDidLoad() {
        let cartTableViewModel = CartTableViewModel(items: (cart?.shoes)!)
        
        let nibName = String(describing: CartItemCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.delegate = cartTableViewModel
        tableView.dataSource = cartTableViewModel
        
        //tableViewHeight.constant = tableView.rowHeight * CGFloat(cart.shoes.count)
    }
}
