//
//  moveBy.swift
//  Sunset
//
//  Created by Brian Veitch on 12/26/22.
//

import Foundation
import UIKit

public extension UIView {
    func moveBy(changeX: CGFloat, changeY: CGFloat, type: UIView.AnimationOptions = .curveEaseInOut, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [type], animations: {
            self.transform = CGAffineTransform(translationX: changeX, y: changeY)
        }, completion: completion)
    }
    
    
}
