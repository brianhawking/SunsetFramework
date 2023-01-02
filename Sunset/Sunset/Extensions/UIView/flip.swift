//
//  flip.swift
//  Sunset
//
//  Created by Brian Veitch on 12/27/22.
//

import Foundation
import UIKit

public enum FlipAnimationType {
    case transitionFlipFromRight
    case transitionFlipFromLeft
    case transitionFlipFromTop
    case transitionFlipFromBottom
}

public extension UIView {
    func flip(type: FlipAnimationType = .transitionFlipFromRight, completion: ((Bool) -> Void)? = nil) {
        
        var flipAnimation: UIView.AnimationOptions = .transitionFlipFromRight
        
        switch type {
        case .transitionFlipFromRight:
            flipAnimation = .transitionFlipFromRight
        case .transitionFlipFromLeft:
            flipAnimation = .transitionFlipFromLeft
        case .transitionFlipFromTop:
            flipAnimation = .transitionFlipFromTop
        case .transitionFlipFromBottom:
            flipAnimation = .transitionFlipFromBottom
        }
        
        let transitionOptions: UIView.AnimationOptions = [flipAnimation, .showHideTransitionViews]

        UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
            
        }, completion: completion)
    }
}
