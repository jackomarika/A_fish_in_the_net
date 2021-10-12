import Foundation
import SpriteKit
import SwiftUI


public class Intro: SKScene {
    
    var goButton: SKSpriteNode!
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.camera = childNode(withName: "//camera") as? SKCameraNode
    }
    
}

