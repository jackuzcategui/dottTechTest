//
//  DottSwitch.swift
//  iOS-assignment
//

import UIKit

class DottSwitch: UISwitch {
    
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

}
