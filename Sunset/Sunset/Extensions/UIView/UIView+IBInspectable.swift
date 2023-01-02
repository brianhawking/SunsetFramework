//
//  UIView+IBInspectable.swift
//  Sunset
//
//  Created by Brian Veitch on 12/26/22.
//

import Foundation
import UIKit

public extension UIView {
    /// SwifterSwift: Border color of view; also inspectable from Storyboard.
        @IBInspectable var layerBorderColor: UIColor? {
            get {
                guard let color = layer.borderColor else { return nil }
                return UIColor(cgColor: color)
            }
            set {
                guard let color = newValue else {
                    layer.borderColor = nil
                    return
                }
                layer.borderColor = color.cgColor
            }
        }

        /// SwifterSwift: Border width of view; also inspectable from Storyboard.
        @IBInspectable var layerBorderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }

        /// SwifterSwift: Corner radius of view; also inspectable from Storyboard.
        @IBInspectable var layerCornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.masksToBounds = true
                layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
            }
        }
}
