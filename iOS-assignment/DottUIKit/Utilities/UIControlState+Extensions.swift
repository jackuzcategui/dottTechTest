//
//  UIControlState+Extensions.swift
//  iOS-assignment
//

import UIKit

extension UIControl.State: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
    
}
