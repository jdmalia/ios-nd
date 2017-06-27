//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
        // You may want to paste your Part 2 implementation of moveComplexRobot() here
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        let wallInfo = checkWalls( myRobot )
        let isThreeWayJunction = 1 == wallInfo.numberOfWalls;
        let isTwoWayPath = 2 == wallInfo.numberOfWalls;
        let isDeadEnd = 3 == wallInfo.numberOfWalls;
        
        if isThreeWayJunction && robotIsBlocked
        {
            randomlyRotateRightOrLeft( myRobot )
        }
        else if isThreeWayJunction && !robotIsBlocked
        {
            continueStraightOrRotate( myRobot, wallInfo: wallInfo )
        }
        else if isTwoWayPath && robotIsBlocked
        {
            turnTowardClearPath( myRobot, wallInfo: wallInfo )
        }
        else if isTwoWayPath && !robotIsBlocked
        {
            myRobot.move()
        }
        else if isDeadEnd
        {
            if robotIsBlocked
            {
                myRobot.rotateRight()
            }
            else
            {
                myRobot.move()
            }
        }
        
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
