//: [Previous](@previous)

import PlaygroundSupport
import SpriteKit
import SwiftUI

var net_broken = SKTexture(imageNamed: "brokenNet@1x 2")
var heart_1 = SKTexture(imageNamed: "cuori1@1x")
var heart_2 = SKTexture(imageNamed: "cuori2@1x")
var heart_3 = SKTexture(imageNamed: "cuori3@1x")

var heart_anim: [SKTexture] = [heart_1, heart_2, heart_3]
class Level2: SKScene {
    
    // var HP = 10
    var net_count: Int = 0
    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
      
        
        // Create shape node to use during mouse interaction
       
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            let location = t.location(in: self)
            let touchedNode = self.atPoint(location)
            if let name = touchedNode.name {
                if name == "net" {
                    net_count += 1
                }
                if name == "net" && net_count == 5{
                    let net = childNode(withName: "net") as? SKSpriteNode
                    let change = SKAction.setTexture(net_broken)
                    let likes = childNode(withName: "likes_label") as? SKLabelNode
                    likes?.text = "0"
                    let heart_node = SKSpriteNode(texture: heart_1)
                    heart_node.position = CGPoint(x: frame.size.width / 2 - 200, y: 0)
                    let animate = SKAction.repeatForever(SKAction.animate(with: heart_anim, timePerFrame: 0.2))
                    heart_node.setScale(2)
                    addChild(heart_node)
                    heart_node.run(animate)
                    net?.run(change)
                }
            }
             }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
 /*   func addNet() {
        var net = SKNode()
        net.name = "net1@1x 2"
        net = self.childNode(withName: "net1@1x 2") as! SKSpriteNode
        
        addChild(net)
        
    }
   */
    
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1684, height: 1190))
if let scene = Level2(fileNamed: "Level2") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView



// let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
//if let scene = GameScene(fileNamed: "GameScene")


//: [Next](@next)
