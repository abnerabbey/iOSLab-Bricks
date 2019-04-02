//
//  ViewController.swift
//  Bricks
//
//  Created by Abner Castro on 4/1/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameScene = GameScene(size: skView.bounds.size)
        gameScene.scaleMode = .aspectFill
        
        skView.presentScene(gameScene)
        
        
        
        gameScene.physicsBody = SKPhysicsBody(edgeLoopFrom: gameScene.frame)
        
        //gameScene.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }


}

