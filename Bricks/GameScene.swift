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
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        view.showsFPS = true
        view.showsNodeCount = true
    }

}
