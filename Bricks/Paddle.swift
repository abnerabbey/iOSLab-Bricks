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
    
    init(color: UIColor, size: CGSize, position: CGPoint) {
        node = SKSpriteNode(color: color, size: size)
        node.position = position
        self.position = position
    }
}
