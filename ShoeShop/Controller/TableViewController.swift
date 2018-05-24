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
    private let segueIdentifier = "showFilters"
    private var cellModels: [ItemCellModelImpl]?
    private var idToImage = [Int: UIImage]()
    
    fileprivate func fillTable(with page: (ShoePage), using client: WebServiceClient) {
        self.cellModels = page.content.map {ItemCellModelImpl(shoeItem: $0)}
        
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
        
        let nibName = String(describing: ItemCell.self)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCell
        
        if let tempCellModel = cellModels?[indexPath.row] {
            cell.nameLabel.text = tempCellModel.name
            cell.priceLabel.text = tempCellModel.price
            cell.itemImage.image = tempCellModel.image
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let controller = segue.destination as! FilterController
            controller.delegate = self
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {}
    
    func onFilterReceived(_ filter: Filter) {
        let client = WebServiceClient()
        client.getShoes(filter: filter, pagination: Pagination(page: 0, size: 100), completion: {page in
            self.fillTable(with: page, using: client)
        })
    }
}
