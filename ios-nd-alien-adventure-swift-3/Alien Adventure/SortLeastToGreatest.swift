//
//  SortLeastToGreatest.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func sortLeastToGreatest(inventory: [UDItem]) -> [UDItem]
    {
        func compareItems(_ a: UDItem, _ b: UDItem) -> Bool
        {
            if a.rarity.rawValue == b.rarity.rawValue
            {
                return a.baseValue < b.baseValue
            }
            return a.rarity.rawValue < b.rarity.rawValue
            
        }
        return inventory.sorted(by: compareItems)
    }
    
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 5"
