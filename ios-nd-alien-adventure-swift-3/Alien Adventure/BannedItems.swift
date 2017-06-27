//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int]
    {
        var bannedIDs = [Int]()
        let dataFileURL = Bundle.main.url(forResource: dataFile, withExtension: "plist")!
        let dataArray = NSArray(contentsOf: dataFileURL) as! [[String:Any]]
        for item in dataArray
        {
            if let name = item["Name"] as? String
            {
                print(name)
                if let historicalData = item["HistoricalData"] as? [String:Any]
                {
                    print ("HISTORICAL DATA")
                    if let age = historicalData["CarbonAge"] as? Int
                    {
                        print(age)
                        if (name.contains("laser") || name.contains("Laser")) && age < 30
                        {
                            print("found one")
                            bannedIDs.append(item["ItemID"]! as! Int)
                        }
                    }
                }
            }
        }
        return bannedIDs
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"
