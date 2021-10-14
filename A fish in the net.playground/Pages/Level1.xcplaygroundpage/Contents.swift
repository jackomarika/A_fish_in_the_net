//: [Previous](@previous)

import PlaygroundSupport
import SpriteKit
import SwiftUI

let fishCategory : UInt32 = 0x1 << 0
let heartCategory : UInt32 = 0x2 << 1

class Level1: SKScene,SKPhysicsContactDelegate {
    
    var bobLevel1 : SKSpriteNode!
    var heart : SKSpriteNode!
    var web : SKSpriteNode!
    var isSpawned : Bool = false
    var webArrived : Bool = false
    var counter : Int = 0
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        self.bobLevel1 = self.childNode(withName: "bobLevel1") as? SKSpriteNode
        self.bobLevel1.physicsBody?.categoryBitMask = fishCategory
        self.bobLevel1.physicsBody?.contactTestBitMask = heartCategory
        self.bobLevel1.physicsBody?.collisionBitMask = 0x0
        self.bobLevel1.physicsBody?.isDynamic = true
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
        
        for touch in touches{
            let rotation = SKAction.rotate(toAngle: 0.1, duration: 0.5)
            let rotation2 = SKAction.rotate(toAngle: -0.1, duration:0.5)
            let glglgl = SKAction.sequence([rotation,rotation2])
            let location = touch.location(in: self)
            let upMove = SKAction.moveTo(y: bobLevel1.position.y + 5000, duration: 10)
            let downMove = SKAction.moveTo(y: bobLevel1.position.y - 5000, duration: 10)
            
            if (location.y < bobLevel1.position.y && bobLevel1.position.y > -frame.size.width/2){
                bobLevel1.run(downMove)
                bobLevel1.run(SKAction.repeatForever(glglgl))
            }else if (location.y>bobLevel1.position.y && bobLevel1.position.y < frame.size.width/2){
                bobLevel1.run(upMove)
                bobLevel1.run(SKAction.repeatForever(glglgl))
            }
        }
            
            
        
        
    }
    /*
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {let t : UITouch = touches.first! as UITouch
        let courrent = t.location(in: bobLevel1!)
        let previous = t.previousLocation(in: bobLevel1!)
        let delta = CGVector(dx: 0, dy: 1)
        self.bobLevel1?.physicsBody?.applyImpulse(delta)
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
        
    }*/
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        let rotation = SKAction.rotate(toAngle: 0.2, duration: 0.5)
        let rotation2 = SKAction.rotate(toAngle: -0.2, duration:0.5)
        let glglgl = SKAction.sequence([rotation,rotation2])
             
        bobLevel1.removeAllActions()
        bobLevel1.run(SKAction.repeatForever(glglgl))
            
            
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.node?.name=="bobLevel1" && contact.bodyB.node?.name=="heart"
        {
            contact.bodyB.node?.removeFromParent()
            run(SKAction.playSoundFileNamed("Pop.mp3", waitForCompletion: false))


        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        
        
        
        if !webArrived{
        if !isSpawned {
            counter+=1
            isSpawned = true
            let wait = SKAction.wait(forDuration: 2)
            run(wait){
                [self] in isSpawned=false
            }
            heart = SKSpriteNode(imageNamed: "heartLevel1@1x")
            heart.name = "heart"
            heart.position = CGPoint(x: 0, y: (CGFloat.random(in:-frame.size.height/2...frame.size.height/2)))
            heart.zPosition = 2
            let heart_body = SKPhysicsBody(circleOfRadius: heart.size.width / 2)
            heart.physicsBody = heart_body
            heart.physicsBody?.affectedByGravity = false
            heart.physicsBody?.categoryBitMask = heartCategory
            heart.physicsBody?.contactTestBitMask = fishCategory
            heart.physicsBody?.collisionBitMask = 0x0
            addChild(heart)
           let action = SKAction.moveBy(x: -3000, y: 0, duration: 15)
            heart.run(SKAction.sequence([action,SKAction.removeFromParent()]))
            print(currentTime)
            if counter == 11 {
                webArrived = true
                self.bobLevel1.removeAllActions()
                self.bobLevel1.run(SKAction.animate(with: [SKTexture(imageNamed: "bobLevel1.2")], timePerFrame: 0.1))
                run(SKAction.playSoundFileNamed("sfx-voice4.mp3", waitForCompletion: false))
            }
        }
        }
        
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1684, height: 1190))
if let scene = Level1(fileNamed: "Level1") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView



// let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
//if let scene = GameScene(fileNamed: "GameScene")

//: [Next](@next)
