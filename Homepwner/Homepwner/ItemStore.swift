//
//  ItemStore.swift
//  Homepwner
//
//  Created by Sameehan Patel on 2/28/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems: [Item] = []
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}