//
//  Brick.swift
//  Bricks
//
//  Created by Néstor I. Martínez Ostoa  on 4/3/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

class Brick: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    static let brickCategory : UInt32 = 0x1 << 2
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = Brick.brickCategory
        physicsBody?.contactTestBitMask = Ball.ballCategory
    }
    
}
