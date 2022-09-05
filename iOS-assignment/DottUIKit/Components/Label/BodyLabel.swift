//
//  BodyLabel.swift
//  iOS-assignment
//

import UIKit

class BodyLabel: DottLabel {
    
    override func setupUI() {
        super.setupUI()
        textColor = DottColorAsset.text.color
        font = DottFont.body
    }
    
}
