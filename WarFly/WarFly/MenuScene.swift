//
//  MenuScene.swift
//  WarFly
//
//  Created by Admin on 28/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class MenuScene: ParentScene {
    override func didMove(to view: SKView) {
        if Assets.shared.isLoaded {
            Assets.shared.preloadAssets()
            Assets.shared.isLoaded = true
        }
        

        self.backgroundColor = SKColor(red: 0.15, green: 0.15, blue: 0.3, alpha: 1.0)
        setHeader(withName: nil, andBackgroung:  "header1")

//        let header = SKSpriteNode(imageNamed: "header1")
//        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
//        self.addChild(header)
//
        let titles = ["play", "options", "best"]
        for (index, title) in titles.enumerated() {
            let button = ButtonNode(titled: title, backgroundName: "button_background")
            button.position = CGPoint(x: self.frame.midX, y: self.frame.midY - CGFloat(100 * index))
            button.name = title
            button.label.name = title
            self.addChild(button)
        }
        
//        let button1 = ButtonNode(titled: "play", backgroundName: "button_background")
//        button1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        button1.name = "play"
//        button1.label.name = "play"
//        self.addChild(button1)
//
//        let button2 = ButtonNode(titled: "options", backgroundName: "button_background")
//        button2.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
//        button2.name = "options"
//        button2.label.name = "options"
//        self.addChild(button2)
//
//        let button3 = ButtonNode(titled: "best", backgroundName: "button_background")
//        button3.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
//        button3.name = "best"
//        button3.label.name = "best"
//        self.addChild(button3)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "play" {
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(gameScene, transition: transition)
        } else if node.name == "options" {
            
            let transition = SKTransition.crossFade(withDuration: 1.0)
            let optionsScene = OptionsScene(size: self.size)
            optionsScene.backScene = self
            optionsScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(optionsScene, transition: transition)
        }
    }
}
