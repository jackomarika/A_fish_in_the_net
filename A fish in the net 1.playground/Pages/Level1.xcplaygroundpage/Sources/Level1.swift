import Foundation
import SpriteKit
import SwiftUI

public class Level1: SKScene {
        var bobLevel1 : SKSpriteNode!
        var heart : SKSpriteNode!
    public override func didMove(to view: SKView){
        self.bobLevel1 = self.childNode(withName: "bobLevel1") as? SKSpriteNode
        self.heart = self.childNode(withName:"heart") as? SKSpriteNode
       
        }
    
    
    }
    

