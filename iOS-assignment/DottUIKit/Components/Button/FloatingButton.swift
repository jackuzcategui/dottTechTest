//
//  FloatingButton.swift
//  iOS-assignment
//

import UIKit

class FloatingButton: DottButton {
    
    override func setupUI() {
        super.setupUI()
        setupContentEdgeInsets()
        layer.cornerRadius = 20
        setupShaddow()
        titleLabel?.font = DottFont.ctaLabel
        backgroundColor = DottColorAsset.floatingButtonBackground.color
    }

}

// MARK: - Healpers

private extension FloatingButton {
        
    func setupContentEdgeInsets() {
        contentEdgeInsets.bottom = 10
        contentEdgeInsets.top = 10
        contentEdgeInsets.left = 20
        contentEdgeInsets.right = 20
    }
    
    func setupShaddow() {
        layer.addShadow(
            color: UIColor.black.withAlphaComponent(0.16),
            offset: CGSize(width: 0.0, height: 2.0),
            blur: 4,
            spread: 0
        )
    }
    
}
