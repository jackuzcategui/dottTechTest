//
//  HeroLabel.swift
//  iOS-assignment
//

import UIKit

class HeroLabel: DottLabel {
    
    override func setupUI() {
        super.setupUI()
        textColor = DottColorAsset.text.color
        font = DottFont.header0
    }
    
}
