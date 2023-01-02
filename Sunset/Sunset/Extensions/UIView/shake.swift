//
//  shake.swift
//  Sunset
//
//  Created by Brian Veitch on 12/23/22.
//

import Foundation
import UIKit

public enum ShakeDirection {
    case horizontal
    case vertical
}

public extension UIView {
    func shake(direction: ShakeDirection) {
        
        switch direction {
        case .horizontal:
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            layer.add(animation, forKey: "shake")
        case .vertical:
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            layer.add(animation, forKey: "shake")
        }
    }
}
