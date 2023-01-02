//
//  rotate.swift
//  Sunset
//
//  Created by Brian Veitch on 12/26/22.
//

import Foundation
import UIKit

public enum RotateDirection {
    case clockwise
    case counterClockwise
}

public enum AnimationType {
    case linear
    case easeIn
    case easeOut
    case easeInOut
}

public extension CAMediaTimingFunctionName {
    static func animationType(type: AnimationType) -> Self {
        switch type {
        case .linear:
            return CAMediaTimingFunctionName(rawValue: CAMediaTimingFunctionName.linear.rawValue)
        case .easeIn:
            return CAMediaTimingFunctionName(rawValue: CAMediaTimingFunctionName.easeIn.rawValue)
        case .easeOut:
            return CAMediaTimingFunctionName(rawValue: CAMediaTimingFunctionName.easeOut.rawValue)
        case .easeInOut:
            return CAMediaTimingFunctionName(rawValue: CAMediaTimingFunctionName.easeInEaseOut.rawValue)
        }
    }
}

/// Rotate UIVIew by a multiple of 90 degrees
public extension UIView {
    /// rotate by multiples of 90 degrees
    func rotate(rotate: RotateDirection, degrees: CGFloat, withDuration duration: TimeInterval, type: AnimationType = .linear) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        switch rotate {
        case .counterClockwise:
            rotation.toValue = NSNumber(value: -1*Double.pi / 180 * degrees)
        case .clockwise:
            rotation.toValue = NSNumber(value: Double.pi / 180 * degrees)
        }
        rotation.duration = duration
        rotation.isCumulative = true
        rotation.repeatCount = 0
        rotation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.animationType(type: type))

        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
