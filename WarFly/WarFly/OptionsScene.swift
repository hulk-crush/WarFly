//
//  OptionsScene.swift
//  WarFly
//
//  Created by Admin on 02/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class OptionsScene: ParentScene {
    
    var isMusic: Bool!
    var isSound: Bool!
    
    override func didMove(to view: SKView) {
        
        isMusic = gameSettings.isMusic
        isSound = gameSettings.isSound
        
        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1.0)
        
        setHeader(withName: "options", andBackgroung: "header_background")
        
        let backgroundNameForMusic = isMusic == true ? "music" : "nomusic"
        
        let musicButton = ButtonNode(titled: nil, backgroundName: backgroundNameForMusic)
        musicButton.position = CGPoint(x: self.frame.midX - 50, y: self.frame.midY)
        musicButton.name = "music"
        musicButton.label.isHidden = true
        addChild(musicButton)
        
        let backgroundNameForSound = isSound == true ? "sound" : "nosound"
        
        let soundButton = ButtonNode(titled: nil, backgroundName: backgroundNameForSound)
        soundButton.position = CGPoint(x: self.frame.midX + 50, y: self.frame.midY)
        soundButton.name = "sound"
        soundButton.label.isHidden = true
        addChild(soundButton)
        
        let back = ButtonNode(titled: "back", backgroundName: "button_background")
        back.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        back.name = "back"
        back.label.name = "back"
        addChild(back)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "music" {
            isMusic = !isMusic
            update(node: node as! SKSpriteNode, property: isMusic)
        } else if node.name == "sound" {
            isSound = !isSound
            update(node: node as! SKSpriteNode, property: isSound)
        } else if node.name == "back"{
            
            gameSettings.isSound = isSound
            gameSettings.isMusic = isMusic
            gameSettings.saveGameSettings()
            
            let transition = SKTransition.crossFade(withDuration: 1.0)
            guard let backScene = backScene else { return }
            backScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(backScene, transition: transition)
        }
    }
    
    func update(node: SKSpriteNode, property: Bool) {
        if let name = node.name {
            node.texture = property ? SKTexture(imageNamed: name) : SKTexture(imageNamed: "no" + name)
        }
    }
    
}


