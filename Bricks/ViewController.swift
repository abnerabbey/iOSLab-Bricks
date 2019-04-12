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
    
    let scoreLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.font = UIFont(name: "Chalkduster", size: 20)
        label.textAlignment = NSTextAlignment(.center)
        return label
    }()
    
    let startAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.tintColor = .yellow
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 20)
        button.setTitle("New Game?", for: .normal)
        return button
    }()
    
    var gameScore = 0 {
        willSet {
            scoreLabel.text = "Score: \(newValue)"
        }
    }
    
    private func setupStartAgainButton(with parent: UIView) {
        let midXCoordinate = view.frame.midX / 4
        let midYCoordinate = view.frame.midY / 4
        let parentHeight = view.frame.midY / 2
        
        startAgainButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: midXCoordinate).isActive = true
        startAgainButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -midXCoordinate).isActive = true
        startAgainButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: midYCoordinate / 3).isActive = true
        
        startAgainButton.heightAnchor.constraint(equalToConstant: parentHeight / 4).isActive = true
        
        startAgainButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }
    
    @objc private func startGame() {
        print("now trying to start game again")
        startGameView.removeFromSuperview()
        viewDidLoad()
    }
    
    private func setupScoreLabel(with parent: UIView){
        let midXCoordinate = view.frame.midX / 4
        let midYCoordinate = view.frame.midY / 4
        let parentHeight = view.frame.midY / 2
        
        scoreLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: midXCoordinate).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -midXCoordinate).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: midYCoordinate).isActive = true
        
        scoreLabel.heightAnchor.constraint(equalToConstant: parentHeight / 4).isActive = true
    }
    
    private func setupStartGameView() {
        startGameView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.frame.midX)/3).isActive = true
        startGameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(view.frame.midX)/3).isActive = true
        startGameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: (view.frame.midY)/2).isActive = true
        startGameView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(view.frame.midY)/2).isActive = true
    }
    
    func gameHasEnded(with score: Int) {
        view.addSubview(startGameView)
        setupStartGameView()
        
        startGameView.addSubview(scoreLabel)
        gameScore = score
        setupScoreLabel(with: startGameView)
        
        startGameView.addSubview(startAgainButton)
        setupStartAgainButton(with: startGameView)
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

