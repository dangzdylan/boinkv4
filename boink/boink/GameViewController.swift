//
//  GameViewController.swift
//  boink
//
//  Created by Dylan Dang on 8/20/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let scene = BlackScreen(size: view.bounds.size)
        let skView = view as! SKView
        
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        skView.allowsTransparency = true
        
        skView.showsPhysics = false
        
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

    
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
