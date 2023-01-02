//
//  fade.swift
//  Sunset
//
//  Created by Brian Veitch on 12/27/22.
//

import Foundation
import UIKit

public extension UIView {
       func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
           UIView.animate(withDuration: duration, animations: {
               self.alpha = 1
           }, completion: completion)
       }

       func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
           UIView.animate(withDuration: duration, animations: {
               self.alpha = 0
           }, completion: completion)
       }

}
