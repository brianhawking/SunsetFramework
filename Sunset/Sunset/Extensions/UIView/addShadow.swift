//
//  addShadow.swift
//  Sunset
//
//  Created by Brian Veitch on 12/27/22.
//

import Foundation
import UIKit

public extension UIView {
    func addShadow(ofColor color: UIColor? = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), radius: CGFloat = .mediumSpacing, offset: CGSize = .zero, opacity: Float = 0.4) {
        if let color = color?.cgColor {
            layer.shadowColor = color
        }
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
