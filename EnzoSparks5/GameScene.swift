//
//  GameScene.swift
//  EnzoSparks5
//
//  Created by Enio Ohmaye on 7/17/14.
//  Copyright (c) 2014 Enio Ohmaye. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        backgroundColor = SKColor.blackColor()
        showEmitter("ParticleSnow", position: CGPoint(x: frame.width/2, y: frame.height - 50))
        
        /* Add video */
        let video = SKVideoNode(videoFileNamed: "Enio.mov")
        video.position = CGPoint(x: 0, y: 0)
        video.setScale(0.2)
        
        let crop = SKCropNode()
        crop.position = CGPoint(x: 500, y: 300)
        //let mask = SKShapeNode(ellipseOfSize: CGSize(width: 100, height: 100))
        let mask = SKSpriteNode(imageNamed: "star")
        mask.setScale(5.0)
        //mask.alpha = 0.5
        crop.maskNode = mask
        crop.addChild(video)
        crop.zPosition = 1.0
        self.addChild(crop)
        video.play()

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    func showEmitter( name : String, position : CGPoint) {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "sks")
        let emitter = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? SKEmitterNode
        emitter!.position = position
        self.addChild(emitter!)
    }
}
