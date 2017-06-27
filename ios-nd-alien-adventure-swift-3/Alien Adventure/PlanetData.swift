//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        let planetJSON = Bundle.main.url(forResource: dataFile, withExtension: "json")!
        let rawPlanetJSON = try! Data(contentsOf: planetJSON)
        
        var planetDictionariesFromJSON: [[String:Any]]!
        do
        {
            planetDictionariesFromJSON = try!
                JSONSerialization.jsonObject(with: rawPlanetJSON,
                                             options: JSONSerialization.ReadingOptions()) as! [[String:Any]]
        }
        var maxScore: Int = 0
        var bestPlanet : String = ""
        for planet in planetDictionariesFromJSON
        {
            let commonItems = planet["CommonItemsDetected"] as! Int
            let uncommonItems = planet["UncommonItemsDetected"] as! Int
            let rareItems = planet["RareItemsDetected"] as! Int
            let legendaryItems = planet["LegendaryItemsDetected"] as! Int
            let score = 4*legendaryItems + 3*rareItems + 2*uncommonItems + commonItems
            if score > maxScore
            {
                maxScore = score
                bestPlanet = planet["Name"] as! String
            }
            
        }
        return bestPlanet
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"
