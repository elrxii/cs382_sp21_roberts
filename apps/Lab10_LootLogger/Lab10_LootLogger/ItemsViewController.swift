//
//  ItemsViewController.swift
//  Lab10_LootLogger
//
//  Created by Ethan Roberts on 3/25/21.
//

import UIKit
class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    override func tableView(_ tableView: UITableView ,
            numberOfRowsInSection section: Int ) -> Int {
            return itemStore.allItems.count
    }
    
    
    override func tableView( _ tableView : UITableView ,
    cellForRowAt indexPath : IndexPath ) -> UITableViewCell {
    let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
    let item = itemStore.allItems [indexPath.row]
    
    cell.textLabel?.text = item.name
     cell.detailTextLabel?.text = "$\(item.valueInDollars)"
     return cell
    }
}


