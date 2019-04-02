//
//  GameScene.swift
//  Bricks
//
//  Created by Jerriodas on 4/1/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        view.showsFPS = true
        view.showsNodeCount = true
        
        let ballGame = Ball(radius: 10, color: .orange)
        ballGame.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        
        ballGame.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        
        
        addChild(ballGame)
        
    }

}
