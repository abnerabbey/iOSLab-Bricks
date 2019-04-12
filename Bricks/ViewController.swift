//
//  ViewController.swift
//  Bricks
//
//  Created by Abner Castro on 4/1/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, GameDelegate {
    
    let startGameView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupStartGameView() {
        startGameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.frame.midX)/3).isActive = true
        startGameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(view.frame.midX)/3).isActive = true
        startGameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: (view.frame.midY)/2).isActive = true
        startGameView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.midY)/2).isActive = true
    }
    
    func gameHasEnded() {
        view.addSubview(startGameView)
        setupStartGameView()
    }
    
    @IBOutlet weak var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameScene = GameScene(size: skView.bounds.size)
        gameScene.scaleMode = .aspectFill
        gameScene.endedGameDelegate = self
        skView.presentScene(gameScene)
        
        // Change this when the paddle is implemented
        gameScene.physicsBody = SKPhysicsBody(edgeLoopFrom: gameScene.frame)
        gameScene.physicsBody?.friction = 0
        skView.showsPhysics = true
        
    }


}

