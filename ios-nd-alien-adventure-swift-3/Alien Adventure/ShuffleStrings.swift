//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1: String, s2: String, shuffle: String) -> Bool {
        if s1=="" && s2=="" && shuffle==""
        {
            return true
        }
        if shuffle.characters.count < s1.characters.count ||
            shuffle.characters.count < s2.characters.count ||
        shuffle.characters.count > (s1.characters.count + s2.characters.count)
        {
            return false
        }
        if validOrderingInString(s1: s1, s2: shuffle) && validOrderingInString(s1: s2, s2: shuffle)
        {
            return true
        }
        return false
    }
    
    func validOrderingInString(s1: String, s2: String) -> Bool
    {
        var prevIndex: Int = -1
        var currIndex: Int
        for ch in s1.characters
        {
            if let range = s2.range(of: String(ch))
            {
                currIndex = s2.distance(from: s2.startIndex, to: range.lowerBound)
                if currIndex < prevIndex
                {
                    return false
                }
            }
            else
            {
                return false
            }
            prevIndex = currIndex
        }
        return true
    }
}

