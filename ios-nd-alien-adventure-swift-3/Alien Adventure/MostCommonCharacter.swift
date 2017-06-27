//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        if inventory.count == 0
        {
            return nil
        }
        var charCounts = [Character:Int] ()
        for item in inventory
        {
            for character in item.name.lowercased().characters
            {
                if let count = charCounts[character]
                {
                    charCounts.updateValue(count+1, forKey: character)
                }
                else
                {
                    charCounts.updateValue(1, forKey: character)
                }
            }
        }
        
        var maxCount: Int = 0
        var mostCommon : Character!
        for charCount in charCounts
        {
            if charCount.value > maxCount
            {
                maxCount = charCount.value
                mostCommon = charCount.key
            }
            
        }
        return mostCommon
    }
}
