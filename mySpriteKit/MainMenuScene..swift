//
//  GameOverScene.swift
//  mySpriteKit
//
//  Created by Daniel Coellar on 4/17/19.
//  Copyright © 2019 dclabs. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    private let dificultLabel = SKLabelNode(fontNamed: "Chalkduster")
    private let mildLabel = SKLabelNode(fontNamed: "Chalkduster")
    private let easyLabel = SKLabelNode(fontNamed: "Chalkduster")

    override func didMove(to view: SKView) {
        var background: SKSpriteNode
        background = SKSpriteNode(imageNamed: "MainMenu")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        self.addChild(background)
        
        dificultLabel.name = "dificult"
        dificultLabel.text = "Expert Dancer"
        dificultLabel.fontColor = SKColor.black
        dificultLabel.fontSize = 100
        dificultLabel.zPosition = 150
        dificultLabel.horizontalAlignmentMode = .center
        dificultLabel.verticalAlignmentMode = .center
        dificultLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(dificultLabel)

        mildLabel.name = "mild"
        mildLabel.text = "Just a Zombie"
        mildLabel.fontColor = SKColor.black
        mildLabel.fontSize = 100
        mildLabel.zPosition = 150
        mildLabel.horizontalAlignmentMode = .center
        mildLabel.verticalAlignmentMode = .center
        mildLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 200)
        addChild(mildLabel)

        easyLabel.name = "easy"
        easyLabel.text = "Easy peasy"
        easyLabel.fontColor = SKColor.black
        easyLabel.fontSize = 100
        easyLabel.zPosition = 150
        easyLabel.horizontalAlignmentMode = .center
        easyLabel.verticalAlignmentMode = .center
        easyLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 400)
        addChild(easyLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            for node in nodes(at: location) {
                if let label = node as? SKLabelNode {
                    if label.name != nil {
                        switch label.name {
                            case "dificult":
                                sceneTapped(level: 3)
                            case "mild":
                                sceneTapped(level: 2)
                            case "easy":
                                sceneTapped(level: 1)
                            default: break
                        }
                    }
                }
            }
        }
    }
    
    func sceneTapped(level: Int) {
        let myScene = GameScene(size: size, level: level)
        myScene.scaleMode = scaleMode
        let reveal = SKTransition.doorway(withDuration: 1.5)
        view?.presentScene(myScene, transition: reveal)
    }
}
