//
//  StateBasedColorable.swift
//  iOS-assignment
//

import Foundation
import UIKit

protocol StateBasedColorable: class {
    
    var tintColors: [UIControl.State: UIColor] { get set }
    var backgroundColors: [UIControl.State: UIColor] { get set }
    
    /// Store the given color that will be used as the button background color when in the given state
    ///
    /// - Parameters:
    ///   - color: the color to use as `backgroundColor` of the button
    ///   - state: the state the button should be to display the given color
    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State)
    
    /// Store the given color that will be used as the tintColor when in the given state
    ///
    /// - Parameters:
    ///   - color: the color to use as `tintColor` of the button
    ///   - state: the state the button should be to display the given color
    func setTintColor(_ color: UIColor?, for state: UIControl.State)
    
    /// Applies the stored colors
    func applyColors()
}
