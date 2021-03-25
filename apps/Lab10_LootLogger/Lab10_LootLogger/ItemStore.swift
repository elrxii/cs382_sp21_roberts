//
//  ItemStore.swift
//  Lab10_LootLogger
//
//  Created by Ethan Roberts on 3/25/21.
//

import UIKit
class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    init(){
        for _ in 0..<5{
            createItem()
        }
    }
}


