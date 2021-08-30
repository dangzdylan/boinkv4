//
//  endLabels.swift
//  dodge2
//
//  Created by Dylan on 8/9/21.
//  Copyright © 2021 S-Crew. All rights reserved.
//

import SpriteKit
import GameplayKit



func gameOver(self:GameScene){
    score.isHidden = true
    gameOverMenu(self:self)
}


func gameOverAnimation(self: SKScene){
    gameHasEnded = true
    for monster in monsterArray{
        monster.physicsBody?.isDynamic = false
    }
    
    Player.physicsBody?.isDynamic = false
    
    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false){timer in
        Player.texture = SKTexture(imageNamed: "boulder")
    }
    
    Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false){timer in
        let movePlayer = SKAction.move(to: CGPoint(x: Player.position.x, y: -screenHeight), duration: 2)
        Player.run(movePlayer)
    }
}


func gameOverMenu(self:SKScene){
    
    let boxZPos:CGFloat = 100
    
    //menu box
    let menuBoxY:CGFloat = screenHeight
    menuBox = SKSpriteNode(color: .darkGray, size: CGSize(width:screenHeight/5, height: screenHeight/4))
    menuBox.position = CGPoint(x:0, y:menuBoxY)
    menuBox.zPosition = boxZPos
    menuBox.texture = SKTexture(imageNamed: "menuBox")
    
    
    //put in score and play again button
    let margins = screenHeight/100
    
    //play again button
    playAgain = SKSpriteNode(color: .white, size: CGSize(width:menuBox.size.width - margins * 2, height: menuBox.size.height/3))
    playAgain.position = CGPoint(x: menuBox.position.x, y: menuBox.position.y - playAgain.size.height + margins)
    playAgain.zPosition = boxZPos + 1
    playAgain.texture = SKTexture(imageNamed: "playAgain")
    playAgainButtonActive = true
    
         
    //word score
    scoreWordLabel = SKLabelNode(text: "SCORE:")
    scoreWordLabel.fontSize = screenHeight/40
    scoreWordLabel.position = CGPoint(x: menuBox.position.x, y: menuBox.position.y + menuBox.size.height/2 - margins - scoreWordLabel.fontSize)
    scoreWordLabel.zPosition = boxZPos + 1
    
    //the actual score
    scoreNumberLabel = SKLabelNode(text: score.text)
    scoreNumberLabel.fontSize = screenHeight/15
    scoreNumberLabel.position = CGPoint(x:menuBox.position.x, y: menuBox.position.y + menuBox.size.height/10)
    scoreNumberLabel.zPosition = boxZPos + 1
    
    //run action
    let boxArr = [menuBox, playAgain, scoreWordLabel, scoreNumberLabel]

    for sprite in boxArr{
        self.addChild(sprite)
        let spriteMove = SKAction.moveTo(y: sprite.position.y - menuBoxY, duration: 1)
        spriteMove.timingMode = .easeOut
        sprite.run(spriteMove)
    }

    
}

func gameOverMenuExit(self:SKScene){
    let boxArr = [menuBox, playAgain, scoreWordLabel, scoreNumberLabel]
    
    //scootdown
    for sprite in boxArr{
        let spriteMove = SKAction.moveTo(y: sprite.position.y - screenHeight/40, duration: 0.3)
        spriteMove.timingMode = .easeOut
        sprite.run(spriteMove)
        
    }
    
    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false){timer in
        for sprite in boxArr{
            let spriteMove = SKAction.moveTo(y: screenHeight, duration: 1)
            spriteMove.timingMode = .easeIn
            sprite.run(spriteMove)
            
        }
    }
    
}
