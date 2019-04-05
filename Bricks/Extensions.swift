//
//  Extensions.swift
//  Bricks
//
//  Created by Martin on 4/4/19.
//  Copyright © 2019 Abner Castro. All rights reserved.
//

import SpriteKit

extension SKColor {
    
    struct GamePalette {
        
        //Brick Levels
        
        //Red
        struct RedBricks {
            static let BrickStrong = SKColor(red:0.96, green:0.00, blue:0.00, alpha:1.0)
            static let BrickMedium = SKColor(red:0.96, green:0.31, blue:0.25, alpha:1.0)
            static let BrickSoft = SKColor(red:0.96, green:0.31, blue:0.25, alpha:1.0)
        }
        //Orange
        struct OrangeBricks {
            static let BrickStrong = SKColor(red:0.90, green:0.35, blue:0.20, alpha:1.0)
            static let BrickMedium = SKColor(red:0.98, green:0.47, blue:0.13, alpha:1.0)
            static let BrickSoft = SKColor(red:1.00, green:0.62, blue:0.11, alpha:1.0)
            
        }
        
        //Yellow
        struct YellowBricks {
            static let BrickStrong = SKColor(red:0.97, green:0.64, blue:0.06, alpha:1.0)
            static let BrickMedium = SKColor(red:0.95, green:0.73, blue:0.04, alpha:1.0)
            static let BrickSoft = SKColor(red:0.94, green:0.78, blue:0.05, alpha:1.0)
            
        }
        
        //Green
        struct GreenBricks {
            static let BrickStrong = SKColor(red:0.01, green:0.50, blue:0.56, alpha:1.0)
            static let BrickMedium = SKColor(red:0.00, green:0.66, blue:0.59, alpha:1.0)
            static let BrickSoft = SKColor(red:0.01, green:0.76, blue:0.60, alpha:1.0)
        }
        //Blue
        struct BlueBricks {
            static let BrickStrong = SKColor(red:0.00, green:0.49, blue:0.65, alpha:1.0)
            static let BrickMedium = SKColor(red:0.00, green:0.66, blue:0.91, alpha:1.0)
            static let BrickSoft = SKColor(red:0.11, green:0.91, blue:1.00, alpha:1.0)
        }
        
        //Purple
        struct PurpleBricks {
            static let BrickStrong = SKColor(red:0.37, green:0.33, blue:0.56, alpha:1.0)
            static let BrickMedium = SKColor(red:0.62, green:0.53, blue:0.75, alpha:1.0)
            static let BrickSoft = SKColor(red:0.75, green:0.58, blue:0.77, alpha:1.0)
        }
        
        //Paddle color
        static let bluePaddle = SKColor(red: 37/255,green: 116/255,blue: 169/255,alpha: 1.0)
        
        //Color ball
        static let grayBall = SKColor(red: 108/255,green: 122/255,blue: 137/255, alpha: 1.0
        )
        
        //White Background
        static let LightMode = SKColor(red:0.94, green:0.92, blue:0.85, alpha:1.0)
        
        static let LighterMode = SKColor(red:242/255, green:241/255, blue:239/255, alpha:1.0)
        
        // Black Background
        static let DarkMode = SKColor(red: 46/255,green: 49/255,blue: 49/255,alpha: 1.0)
        
    }
    
}
