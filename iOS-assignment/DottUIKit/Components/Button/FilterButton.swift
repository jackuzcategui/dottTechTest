//
//  FilterButton.swift
//  iOS-assignment
//

import UIKit

class FilterButton: FloatingButton {
    
    override func setupUI() {
        super.setupUI()
        imageEdgeInsets.left = -8
        adjustsImageWhenHighlighted = false
        isFilterActive = false
    }
    
    var isFilterActive: Bool = false {
        didSet {
            if isFilterActive {
                backgroundColor = DottColorAsset.floatingButtonHighlightedBackground.color
                setImage(DottImageAsset.Icon.checkmark.image, for: .normal)
                setTitle("Filter active", for: .normal)
            } else {
                backgroundColor = DottColorAsset.floatingButtonBackground.color
                setImage(DottImageAsset.Icon.scooter.image, for: .normal)
                setTitle("Filter", for: .normal)
            }
        }
    }
}
