//
//  GameScene.swift
//  Bricks
//
//  Created by Jerriodas on 4/1/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var bricksHandler = BricksHandler()
    
    var paddle: Paddle?
    var movingPaddle = false
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        view.showsFPS = true
        view.showsNodeCount = true
        
        view.showsPhysics = true
        physicsWorld.contactDelegate = self
        
        bricksHandler.loadBricks(rows: 5, in: self)
        setupPaddle()
        setUpBall()
    
    }
    
    func setUpBall(){
        
        let ballGame = Ball(texture: SKTexture(imageNamed: "icon"), color: .orange, size: CGSize(width: 18, height: 18))
        ballGame.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        ballGame.physicsBody!.contactTestBitMask = ballGame.physicsBody!.collisionBitMask
        ballGame.name = "ball"
        
        
        addChild(ballGame)
        
    }
    
    func setupPaddle() {
        
        let paddleSize = CGSize(width: 150, height: 25)
        let paddleOriginPosition = CGPoint(x: view!.frame.width / 2, y: 100)
        
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
    
    
    func collisionBetween(ballGame: SKNode, object: SKNode) {
        if object.name == "brick" {
            print("")
        }
        else if object.name == "paddle" {
            print("paddle")
            ballGame.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 5.0))
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if nodeA.name == "ball" {
            collisionBetween(ballGame: nodeA, object: nodeB)
        } else if nodeB.name == "ball" {
            collisionBetween(ballGame: nodeB, object: nodeA)
        }
    }

}
