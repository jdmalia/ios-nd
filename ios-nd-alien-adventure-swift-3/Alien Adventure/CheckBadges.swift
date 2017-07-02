//
//  CheckBadges.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func checkBadges(badges: [Badge], requestTypes: [UDRequestType]) -> Bool {
        for requestType in requestTypes
        {
            var found : Bool = false
            for badge in badges
            {
                if badge.requestType == requestType
                {
                    found = true
                }
            }
            if !found
            {
                return false
            }
        }
        return true
    }
    
}
