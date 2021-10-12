import Foundation
import SpriteKit
import SwiftUI


public class Intro: SKScene {
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.camera = childNode(withName: "//camera") as? SKCameraNode
    }
    
}

