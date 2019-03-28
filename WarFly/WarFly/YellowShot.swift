//
//  YellowShot.swift
//  WarFly
//
//  Created by Admin on 28/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class YellowShot: Shot {
    
    init() {
        let textureAtlas =  Assets.shared.yellowAmmoAtlas //SKTextureAtlas(named: "YellowAmmo")
        super.init(textureAtlas: textureAtlas)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
