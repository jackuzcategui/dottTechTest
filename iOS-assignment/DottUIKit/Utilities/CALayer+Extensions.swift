//
//  CALayer+Extensions.swift
//  iOS-assignment
//

import UIKit

extension CALayer {
    
    func addShadow(
        color: UIColor,
        offset: CGSize,
        blur: CGFloat,
        spread: CGFloat
    ) {
        shadowColor = color.cgColor
        shadowOpacity = 1
        shadowOffset = offset
        shadowRadius = blur / 2
        shadowPath = nil
        
        if spread != 0 {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}
