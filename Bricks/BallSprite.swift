//
//  BallSprite.swift
//  Bricks
//
//  Created by Jerriodas on 4/2/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import SpriteKit
import UIKit

class Ball: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    
    //Here will come the ball configuration
    static let ballCategory : UInt32 = 0x1 << 0
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(circleOfRadius: 10)
        physicsBody?.isDynamic = true
        physicsBody?.affectedByGravity = true //change to false when the Game Dynamics are implemented
        physicsBody?.restitution = 1.0
        physicsBody?.linearDamping = 0
        physicsBody?.allowsRotation = false
        physicsBody?.categoryBitMask = Ball.ballCategory
        physicsBody?.contactTestBitMask = Paddle.paddleCategory | Brick.brickCategory
        
        
    }
        
        
    
}



