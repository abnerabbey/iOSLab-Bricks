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
    
    var paddle: Paddle?
    var movingPaddle = false
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        view.showsFPS = true
        view.showsNodeCount = true
        
        let paddleSize = CGSize(width: 150, height: 25)
        let paddleOriginPosition = CGPoint(x: view.frame.width / 2, y: 100)
        
        paddle = Paddle(color: .cyan, size: paddleSize , position: paddleOriginPosition)
        
        addChild(paddle!.node)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let position = touch.location(in: self)
            
            if nodes(at: position).contains(paddle!.node) {
                movingPaddle = true
                paddle?.position = position
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            if movingPaddle {
                let position = touch.location(in: self)
                paddle?.position = position
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPaddle = false
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPaddle = false
    }
    

}
