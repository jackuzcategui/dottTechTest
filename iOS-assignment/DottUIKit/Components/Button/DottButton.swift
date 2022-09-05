//
//  DottButton.swift
//  iOS-assignment
//

import UIKit

class DottButton: UIButton, StateBasedColorable {
        
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    // MARK: - StateBasedColorable
    
    var tintColors: [UIControl.State: UIColor] = [:]
    var backgroundColors: [UIControl.State: UIColor] = [:]
    
    override open var isHighlighted: Bool {
        didSet {
            applyColors()
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            applyColors()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            applyColors()
        }
    }
    
}
