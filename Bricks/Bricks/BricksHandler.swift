//
//  BricksHandler.swift
//  Bricks
//
//  Created by Néstor I. Martínez Ostoa  on 4/3/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import Foundation
import SpriteKit

class BricksHandler {
    
    func createBrick(color: UIColor, size: CGSize) -> Brick{
        return Brick(texture: nil, color: color, size: size)
    }
    
    func loadBricks(rows numberOfRows: Int, in scene: SKScene) {
        let brickSize = CGSize(width: scene.frame.width / 6, height: scene.frame.height / 30)
        let finalX = Int(scene.frame.width / brickSize.width)
        for column in 0 ..< finalX{
            for row in 0 ..< numberOfRows {
                let brick = createBrick(color: .red, size: brickSize)
                brick.name = "brick"
                let xOffset = column*Int(brickSize.width)
                let x = brick.size.width/2 + CGFloat(xOffset)
                let y = (scene.frame.height - brick.size.height/2) - CGFloat(row*Int(brickSize.height))
                brick.position = CGPoint(x: x, y: y)
                scene.addChild(brick)
            }
        }
    }
    
}
