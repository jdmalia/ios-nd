//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
    let isWooden: Bool
    

    var cells: [GridLocation] {
        get {
            let start = self.location
            let end: GridLocation = ShipEndLocation(self)
            
            var occupiedCells = [GridLocation]()
            occupiedCells.append(start)
            
            var currCol = start.x, currRow = start.y
            let endCol = end.x, endRow = end.y
            
            var icr = currCol < endCol ? 1 : -1
            while currCol != endCol
            {
                occupiedCells.append( GridLocation( x: currCol, y: currRow ) )
                currCol += icr
            }
            icr = currRow < endRow ? 1 : -1
            while currRow != endRow
            {
                occupiedCells.append( GridLocation( x: currCol, y: currRow ) )
                currRow += icr
            }
            occupiedCells.append(end)
            

            return occupiedCells
        }
    }
    
    var hitTracker: HitTracker
    
    var sunk: Bool {
        for (_, hit) in hitTracker.cellsHit
        {
            if !hit
            {
                return false
            }
        }
        return true
    }

    init(length: Int)
    {
        self.init(length: length, location: GridLocation(x: 0, y: 0),isVertical: true)
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool)
    {
        self.init(length: length, location: location, isVertical: isVertical, isWooden: true)
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool, isWooden: Bool)
    {
        self.init(length: length, location: location, isVertical: isVertical, isWooden: isWooden, hitTracker: HitTracker())
    }
    
    init(length: Int, location: GridLocation, isVertical: Bool, isWooden: Bool, hitTracker: HitTracker)
    {
        self.length = length
        self.location = location
        self.isVertical = isVertical
        self.isWooden = isWooden
        self.hitTracker = hitTracker
    }

}

protocol PenaltyCell {
    var location: GridLocation {get}
    var guaranteesHit: Bool {get}
    var penaltyText: String {get}
}

struct Mine: PenaltyCell {
    let location: GridLocation
    var guaranteesHit: Bool
    var penaltyText: String

    init (location: GridLocation)
    {
        self.location = location
        self.guaranteesHit = false
        self.penaltyText = "You hit a mine!"
    }
}

struct SeaMonster: PenaltyCell {
    let location: GridLocation
    var guaranteesHit: Bool
    var penaltyText: String
    
    init (location: GridLocation)
    {
        self.location = location
        self.guaranteesHit = true
        self.penaltyText = "You hit a sea monster!"
    }
}

class ControlCenter {
    
    func placeItemsOnGrid(_ human: Human) {
        
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 4), isVertical: true, isWooden: false, hitTracker: HitTracker())
        human.addShipToGrid(smallShip)
        
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false, isWooden: false, hitTracker: HitTracker())
        human.addShipToGrid(mediumShip1)
        
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 3, y: 1), isVertical: false, isWooden: false, hitTracker: HitTracker())
        human.addShipToGrid(mediumShip2)
        
        let largeShip = Ship(length: 4, location: GridLocation(x: 6, y: 3), isVertical: true, isWooden: true, hitTracker: HitTracker())
        human.addShipToGrid(largeShip)
        
        let xLargeShip = Ship(length: 5, location: GridLocation(x: 7, y: 2), isVertical: true, isWooden: true, hitTracker: HitTracker())
        human.addShipToGrid(xLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 0))
        human.addMineToGrid(mine1)
        
        let mine2 = Mine(location: GridLocation(x: 3, y: 3))
        human.addMineToGrid(mine2)
        
        let seamonster1 = SeaMonster(location: GridLocation(x: 5, y: 6))
        human.addSeamonsterToGrid(seamonster1)
        
        let seamonster2 = SeaMonster(location: GridLocation(x: 2, y: 2))
        human.addSeamonsterToGrid(seamonster2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let sinkBonus = (5 - gameStats.enemyShipsRemaining) * gameStats.sinkBonus
        let shipBonus = (5 - gameStats.humanShipsSunk) * gameStats.shipBonus
        let guessPenalty = (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
        
        finalScore = sinkBonus + shipBonus - guessPenalty
        
        return finalScore
    }
}
