import Foundation
import SpriteKit
import SwiftUI


public class End: SKScene {
    
    public override func sceneDidLoad() {
        super.sceneDidLoad()
        self.camera = childNode(withName: "//camera") as? SKCameraNode
    }
    
    }

