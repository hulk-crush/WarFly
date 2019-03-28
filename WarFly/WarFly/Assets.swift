//
//  Assets.swift
//  WarFly
//
//  Created by Admin on 28/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SpriteKit

class Assets {
    static let shared = Assets()
    let yellowAmmoAtlas = SKTextureAtlas(named: "YellowAmmo")
    let bluePowerUpAtlas = SKTextureAtlas(named: "BluePowerUp")
    let greenPowerUpAtlas = SKTextureAtlas(named: "GreenPowerUp")
    let enemy_1Atlas = SKTextureAtlas(named: "Enemy_1")
    let enemy_2Atlas = SKTextureAtlas(named: "Enemy_2")
    let playerPlaneAtlas = SKTextureAtlas(named: "PlayerPlane")

    func preloadAssets() {
        yellowAmmoAtlas.preload { print("yellowAmmoAtlas preloaded") }
        bluePowerUpAtlas.preload { print("bluePowerUpAtlas preloaded") }
        greenPowerUpAtlas.preload { print("greenPowerUpAtlas preloaded") }
        enemy_1Atlas.preload { print("enemy_1Atlas preloaded") }
        enemy_2Atlas.preload { print("enemy_2Atlas preloaded") }
        playerPlaneAtlas.preload { print("playerPlaneAtlas preloaded") }
    }
}
