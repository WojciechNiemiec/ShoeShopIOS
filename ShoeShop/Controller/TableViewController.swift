//
//  TableViewController.swift
//  ShoeShop
//
//  Created by Wojciech Niemiec on 4/12/18.
//  Copyright © 2018 Wojciech Niemiec. All rights reserved.
//

import UIKit

protocol ModelAppender {
    func append(_ itemCellModel: ItemCellModelImpl) -> Void
    func refresh() -> Void
}

class TableViewController: UITableViewController, FilterDelegate {
    
    private let cellIdentifier = "reuseIdentifier"
    private let filterSegueIdentifier = "showFilters"
    private let presentSegueIdentifier = "showDetails"
    private var shoeItems: [ShoeItem] = []
    private var cellModels: [ItemCellModelImpl]?
    private var idToImage = [Int: UIImage]()
    
    fileprivate func fillTable(with page: (ShoePage), using client: WebServiceClient) {
        shoeItems = page.content
        self.cellModels = shoeItems.map {ItemCellModelImpl(shoeItem: $0)}
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let ids = page.content.map{$0.variantId}
            client.getPictures(for: ids, completion: {id, picture in
                if let model = self.cellModels?.filter({el in el.variantId == id}).first {
                    model.image = picture
                    let index = self.cellModels?.index(of: model)!
                    let indexPath = IndexPath(item: index!, section: 0)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadRows(at: [indexPath], with: .left)
                    }
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = String(describing: ShoeItemCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        let client = WebServiceClient()
        client.getShoes(pagination: Pagination(page: 0, size: 100), completion: {page in
            self.fillTable(with: page, using: client)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ShoeItemCell
        
        if let tempCellModel = cellModels?[indexPath.row] {
            cell.nameLabel.text = tempCellModel.name
            cell.priceLabel.text = tempCellModel.price
            cell.itemImage.image = tempCellModel.image
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: presentSegueIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == filterSegueIdentifier {
            let controller = segue.destination as! FilterController
            controller.delegate = self
        } else if segue.identifier == presentSegueIdentifier {
            let controller = segue.destination as! ShoeViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let shoeItem = shoeItems[indexPath.row]
            controller.shoe = shoeItem
            controller.image = cellModels?.filter {$0.variantId == shoeItem.variantId}.first?.image
        }
    }
    
    func onFilterReceived(_ filter: Filter) {
        navigationController?.popViewController(animated: true)
        let client = WebServiceClient()
        client.getShoes(filter: filter, pagination: Pagination(page: 0, size: 100), completion: {page in
            self.fillTable(with: page, using: client)
        })
    }
}
