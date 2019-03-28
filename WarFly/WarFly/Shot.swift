//
//  Shot.swift
//  WarFly
//
//  Created by Admin on 28/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class Shot: SKSpriteNode {
    
    let screenSize = UIScreen.main.bounds
    fileprivate let initialSize = CGSize(width: 187, height: 237)
    fileprivate let textureAtlas: SKTextureAtlas!
    fileprivate var animationSpriteArray = [SKTexture]()
    fileprivate var textureNameBeingsWith = ""
    
    
    init(textureAtlas: SKTextureAtlas) {
        self.textureAtlas = textureAtlas
        let textureName = textureAtlas.textureNames.sorted()[0]
        let texture = textureAtlas.textureNamed(textureName)
        textureNameBeingsWith = String(textureName.characters.dropLast(6))
        super.init(texture: texture, color: .clear, size: initialSize)
        self.setScale(0.3)
        self.name = "shotSprite"
        self.zPosition = 30
    }
    
    func startMovement() {
        performRotation()
        
        let moveForvard = SKAction.moveTo(y: screenSize.height + 100 , duration: 2)
        self.run(moveForvard)
    }
    
    
    fileprivate func performRotation() {
        for i in 1...32 {
            let number = String(format: "%02d", i)
            animationSpriteArray.append(SKTexture(imageNamed: textureNameBeingsWith + number.description))
        }
        
        SKTexture.preload(animationSpriteArray) {
            let rotation = SKAction.animate(with: self.animationSpriteArray, timePerFrame: 0.05, resize: true, restore: false)
            let rotationForever = SKAction.repeatForever(rotation)
            self.run(rotationForever)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

