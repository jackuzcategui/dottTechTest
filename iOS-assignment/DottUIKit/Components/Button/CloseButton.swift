//
//  CloseButton.swift
//  iOS-assignment
//

import UIKit

class CloseButton: DottButton {
        
    override func setupUI() {
        super.setupUI()
        layer.cornerRadius = bounds.size.width / 2
        setImage(DottImageAsset.Icon.cross.image, for: .normal)
        backgroundColor = DottColorAsset.closeButtonBackground.color
    }
    
}
