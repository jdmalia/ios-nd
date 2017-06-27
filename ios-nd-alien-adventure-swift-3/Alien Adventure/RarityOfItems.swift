//
//  RarityOfItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func rarityOfItems(inventory: [UDItem]) -> [UDItemRarity:Int] {
        var rarityCount = [UDItemRarity:Int]()
        rarityCount[.common] = 0
        rarityCount[.uncommon] = 0
        rarityCount[.rare] = 0
        rarityCount[.legendary] = 0
        for item in inventory
        {
            rarityCount[item.rarity]! += 1
        }
        return rarityCount
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 4"
