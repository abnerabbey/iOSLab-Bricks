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
    
    var actualBallPositionX = CGFloat()
    var oldBallPosition = CGFloat()
    
    var ballDirection: direction = .left
    
    enum direction {
        case left, right
    }
    
    var ballGame = SKSpriteNode()
    
    
    static let bottomCategory : UInt32 = 0x1 << 3
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsPhysics = true
        physicsWorld.contactDelegate = self
                
        bricksHandler.loadBricks(rows: 5, in: self)
        setupPaddle()
        setUpBall()
        bottomBoundary()
        
    }
    
    func setUpBall() {
        
        ballGame = Ball(texture: SKTexture(imageNamed: "icon"), color: .orange, size: CGSize(width: 18, height: 18))
        ballGame.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        ballGame.name = "ball"
        
        
        addChild(ballGame)
        
    }
    
    func setupPaddle() {
        
        let paddleSize = CGSize(width: 150, height: 25)
        let paddleOriginPosition = CGPoint(x: view!.frame.width / 2, y: 100)
        
        paddle = Paddle(color: .cyan, size: paddleSize , position: paddleOriginPosition)
        
        
        addChild(paddle!.node)
        
    }
    
    func bottomBoundary() {
        let bottom =  SKSpriteNode()
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1))
        bottom.physicsBody?.categoryBitMask = GameScene.bottomCategory
        addChild(bottom)
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
    
    override func update(_ currentTime: TimeInterval) {
        actualBallPositionX = ballGame.position.x
        
        ballDirection = actualBallPositionX < oldBallPosition ? .left : .right
        
        oldBallPosition = actualBallPositionX
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.categoryBitMask == Ball.ballCategory && secondBody.categoryBitMask == Paddle.paddleCategory {
//            print("ball&paddle")
            guard let childsNodes = self.scene?.children else { return }
            for child in childsNodes {
                if child.name == "ball" {

                    let maxSpeed: CGFloat = 1500.0
                    let xSpeed = CGFloat((child.physicsBody?.velocity.dx)!)
                    let ySpeed = CGFloat((child.physicsBody?.velocity.dy)!)
                    let speed = sqrt(xSpeed*xSpeed + ySpeed*ySpeed)
                    
//                    print("x:\(xSpeed)   y:\(ySpeed)  s:\(speed)")
                    
                    if xSpeed <= 10.0 {
                        if ballDirection == .left {
                            child.physicsBody?.applyImpulse(CGVector(dx: -3.0, dy: 0.0))
                        }
                        else {
                            child.physicsBody?.applyImpulse(CGVector(dx: 3.0, dy: 0.0))
                        }
                        
                    }
                    
                    if ySpeed <= 1000.0 {
                        child.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
                    }
                    
                    if speed > maxSpeed {
                        child.physicsBody?.linearDamping = 0.2
                    }
                    else {
                        child.physicsBody?.linearDamping = 0.0
                    }
                
                }
            }
        }
        
        else if firstBody.categoryBitMask == Ball.ballCategory && secondBody.categoryBitMask == GameScene.bottomCategory {
//            print("ball&bottom")
        }
        
        else if firstBody.categoryBitMask == Ball.ballCategory && secondBody.categoryBitMask == Brick.brickCategory  {
//            print("ball&brick")
            
        }
       
      
    }

}
