//
//  BallSprite.swift
//  Bricks
//
//  Created by Jerriodas on 4/2/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import SpriteKit
import UIKit

class Ball: SKShapeNode {
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    //Here will come the ball configuration
    
    init(radius: CGFloat, color: UIColor) {
        super.init()
        
        let diameter = radius * 2
        self.path = CGPath(ellipseIn: CGRect(origin: .zero, size: CGSize(width: diameter, height: diameter)), transform: nil)
        
        self.fillColor = color
    }
    
}



