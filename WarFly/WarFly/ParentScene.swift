//
//  ParentScene.swift
//  WarFly
//
//  Created by Admin on 02/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class ParentScene: SKScene {
    let sceneManager = SceneManager.shared

    var backScene: SKScene?
    
    func setHeader(withName name: String?, andBackgroung backgoundName: String) {
        let header = ButtonNode(titled: name, backgroundName: backgoundName)
        header.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 150)
        self.addChild(header)
    }
}
