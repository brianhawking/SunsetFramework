//
//  UIViewAnimationsViewController.swift
//  Demo
//
//  Created by Brian Veitch on 12/23/22.
//

import UIKit
import Sunset
import Foundation

class UIViewAnimationsViewController: UIViewController {
    
    // states
    let flipStates: [FlipAnimationType] = [.transitionFlipFromTop, .transitionFlipFromRight, .transitionFlipFromBottom, .transitionFlipFromLeft]
    var flipState = 0
    
    @IBOutlet var box: UIView!
    @IBOutlet var rotateCC: UIButton!
    @IBOutlet var rotateC: UIButton!
    @IBOutlet var horizontalShake: UIButton!
    @IBOutlet var veriticalShake: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        box.fadeOut(duration: 0, completion: nil)
        box.addShadow(ofColor: UIColor(hex: "#000000"), radius: 20, offset: .zero, opacity: 0.5)
        box.fadeIn(duration: 0.5)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            // rotate CC
            box.rotate(rotate: .counterClockwise, degrees: 720, withDuration: 1, type: .easeInOut)
        case 2:
            // rotate C
            box.rotate(rotate: .clockwise, degrees: 180, withDuration: 1)
        case 3:
            // horizontal shake
            box.shake(direction: .horizontal)
        case 4:
            //veritical shake
            box.shake(direction: .vertical)
        case 5:
            // move by
            let randomX = Double.random(in: -100...100).rounded()
            let randomY = Double.random(in: 100...400).rounded()
            box.moveBy(changeX: randomX, changeY: randomY, completion: { _ in
                self.box.moveBy(changeX: 0, changeY: 0)
            })
        case 6:
            box.fadeIn(duration: 1)
        case 7:
            box.fadeOut(duration: 1)
        case 8:
            box.flip(type: flipStates[flipState]) { _ in
                self.flipState = (self.flipState + 1) % 4
            }
        default:
            break
        }
    }
    
    
}

