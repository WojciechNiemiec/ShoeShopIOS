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

class TableViewController: UITableViewController, ModelAppender {
  
    private let cellIdentifier = "reuseIdentifier"
    private var cellModels: [ItemCellModelImpl]?
    private var idToImage = [Int: UIImage]()
    
    func append(_ itemCellModel: ItemCellModelImpl) {
        if (cellModels == nil) {
            cellModels = [ItemCellModelImpl]()
        }
        cellModels?.append(itemCellModel)
    }
    
    func refresh() {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = String(describing: ItemCell.self)
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        let client = WebServiceClient()
        client.getShoes(pagination: Pagination(page: 0, size: 100), completion: {page in
            self.cellModels = page.content.map {ItemCellModelImpl(shoeItem: $0)}
            
            DispatchQueue.main.async {
                self.refresh()
                let ids = page.content.map{$0.variantId}
                client.getPictures(for: ids, completion: {id, picture in
                    if let model = self.cellModels?.filter({el in el.variantId == id}).first {
                        model.image = picture
                        let index = self.cellModels?.index(of: model)!
                        let indexPath = IndexPath(item: index!, section: 0)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadRows(at: [indexPath], with: .top)
                        }
                    }
                })
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemCell
        
        if let tempCellModel = cellModels?[indexPath.row] {
            cell.nameLabel.text = tempCellModel.name
            cell.priceLabel.text = tempCellModel.price + " PLN"
            cell.itemImage.image = tempCellModel.image
        }
        
        return cell
    }
    
    @IBAction func filter(_ sender: UIStoryboardSegue) {
        
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
