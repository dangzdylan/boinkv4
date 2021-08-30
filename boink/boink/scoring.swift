//
//  labels.swift
//  dodge2
//
//  Created by Dylan on 8/2/21.
//  Copyright © 2021 S-Crew. All rights reserved.
//

import SpriteKit
import GameplayKit


func addScore(self:SKScene){
    score.text = "0"
    scoreNum = 0
    score.fontSize = screenHeight/4
    score.fontColor = labelColor
    
    score.position = CGPoint(x:0, y:-screenHeight/8)
    score.zPosition = -10
    
    self.addChild(score)
}


func addToScore(self:SKScene){
    
    scoreNum += 1
    
    let spawnArr = [10, 20]
    if scoreNum == spawnArr[spawnArrInd]{
        spawnMonster(self: self)
        spawnArrInd += 1
    }
    score.text = String(scoreNum)
}






