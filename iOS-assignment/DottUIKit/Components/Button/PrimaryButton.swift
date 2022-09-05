//
//  PrimaryButton.swift
//  iOS-assignment
//

import UIKit

class PrimaryButton: DottButton {
        
    override func setupUI() {
        super.setupUI()
        layer.cornerRadius = 8
        titleLabel?.font = DottFont.ctaLabel
        setupColors()
    }
    
}

// MARK: - Healpers

private extension PrimaryButton {

    func setupColors() {
        setBackgroundColor(
            DottColorAsset.constructiveButtonBackground.color,
            for: .normal
        )
        setBackgroundColor(
            DottColorAsset.constructiveDisabledButtonBackground.color,
            for: .disabled
        )
        
        setBackgroundColor(
            DottColorAsset.constructiveHighlightedButtonBackground.color,
            for: .highlighted
        )
        
        setTintColor(
            DottColorAsset.buttonText.color,
            for: .normal
        )
    }
    
}
