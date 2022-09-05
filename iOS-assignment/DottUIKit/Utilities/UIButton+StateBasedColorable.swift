//
//  UIButton+StateBasedColorable.swift
//  iOS-assignment
//
//  Created by Nazih Shoura on 12/11/2020.
//

import UIKit

extension StateBasedColorable where Self: UIButton {
    
    func setTintColor(_ color: UIColor?, for state: UIControl.State) {
        if let color = color {
            tintColors[state] = color
        } else {
            tintColors.removeValue(forKey: state)
        }
        
        applyTintColorIfNeeded()
    }
    
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        if let color = color {
            backgroundColors[state] = color
        } else {
            backgroundColors.removeValue(forKey: state)
        }
        
        applyBackgroundColorIfNeeded()
    }
    
    func applyColors() {
        applyBackgroundColorIfNeeded()
        applyTintColorIfNeeded()
    }
}

// MARK: - Healpers

private extension StateBasedColorable where Self: UIButton {
    
    // MARK: - tintColors
    
    func applyTintColorIfNeeded() {
        if !isEnabled, let disabledTintColor = tintColors[.disabled] {
            tintColor = disabledTintColor
        } else if isHighlighted, let highlightedTintColor = tintColors[.highlighted] {
            tintColor = highlightedTintColor
        } else if isSelected, let selectedTintColor = tintColors[.selected] {
            tintColor = selectedTintColor
        } else if let normalTinColor = tintColors[.normal] {
            tintColor = normalTinColor
        }
    }
    
    // MARK: - backgroundColors
    
    func applyBackgroundColorIfNeeded() {
        if !isEnabled, let disabledBackgroundColor = backgroundColors[.disabled] {
            backgroundColor = disabledBackgroundColor
        } else if isHighlighted, let highlightedBackgroundColor = backgroundColors[.highlighted] {
            backgroundColor = highlightedBackgroundColor
        } else if isSelected, let selectedBackgroundColor = backgroundColors[.selected] {
            backgroundColor = selectedBackgroundColor
        } else if let normalBackgroundColor = backgroundColors[.normal] {
            backgroundColor = normalBackgroundColor
        }
    }
}
