//
//  TitleLabel.swift
//  iOS-assignment
//

import UIKit

class TitleLabel: DottLabel {
    
    override func setupUI() {
        super.setupUI()
        textColor = DottColorAsset.text.color
        font = DottFont.header1
    }
    
}
