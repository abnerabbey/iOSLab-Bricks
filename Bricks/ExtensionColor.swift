

import UIKit
import SpriteKit

extension SKColor {

    struct GamePalette {
        
        //Brick Levels
        struct OrangeBricks {
            static let BrickStrong = SKColor(red:0.05, green:0.53, blue:0.88, alpha:1.0)
            static let BrickMedium = SKColor(red:0.06, green:0.54, blue:0.25, alpha:1.0)
            static let BrickSoft = SKColor(red:0.06, green:0.99, blue:0.69, alpha:1.0)
            
            
            static let BrickStrong2 = SKColor(red:0.90, green:0.35, blue:0.20, alpha:1.0)
            static let BrickMedium2 = SKColor(red:0.98, green:0.47, blue:0.13, alpha:1.0)
            static let BrickSoft2 = SKColor(red:1.00, green:0.62, blue:0.11, alpha:1.0)
            
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
