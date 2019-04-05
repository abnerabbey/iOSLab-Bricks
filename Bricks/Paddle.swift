//
//  Paddle.swift
//  Bricks
//
//  Created by Alejandro Mendoza on 4/2/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

struct Paddle {
    var position: CGPoint = CGPoint(x: 0, y: 0) {
        willSet {
            node.position = CGPoint(x: newValue.x, y: node.position.y)
        }
    }
    
    let node: SKNode
    static let paddleCategory : UInt32 = 0x1 << 1
    
    init(color: UIColor, size: CGSize, position: CGPoint) {
        node = SKSpriteNode(color: color, size: size)
        node.name = "paddle"
        node.position = position
        node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 150, height: 25))
        node.physicsBody?.isDynamic = false
        node.physicsBody?.friction = 0
        node.physicsBody?.categoryBitMask = Paddle.paddleCategory
        node.physicsBody?.contactTestBitMask = Ball.ballCategory

        self.position = position
    }
}
