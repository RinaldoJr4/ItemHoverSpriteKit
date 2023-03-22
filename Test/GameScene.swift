//
//  GameScene.swift
//  Test
//
//  Created by rsbj on 28/02/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player : SKSpriteNode?
    var place : SKSpriteNode?
    var touchPlayer: Bool = false
    
    override func didMove(to view: SKView) {
        positionThings()
        
    }
    
    func positionThings() {
        place = SKSpriteNode(color: .yellow, size: CGSize(width: 50, height: 50))
        place?.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(place!)
        player = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        player?.position = CGPoint(x: self.frame.midX-200, y: self.frame.midY-200)
        addChild(player!)
    }
    
    func isPlayer(location: CGPoint) -> Bool {
        if location.x <= player!.position.x+25 && location.x >= player!.position.x-25 && location.y <= player!.position.y+25 && location.y >= player!.position.y-25 {
            return true
        } else {
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        if isPlayer(location: location) {
            touchPlayer = true
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: self)
        if touchPlayer {
            player!.position = location
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPlayer = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if place!.position.x+10 <= player!.position.x+25 && place!.position.x-10 >= player!.position.x-25 && place!.position.y+10 <= player!.position.y+25 && place!.position.y-10 >= player!.position.y-25 {
            
            place!.color = UIColor.red
        }
    }
}
