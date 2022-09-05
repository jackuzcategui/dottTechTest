//
//  DottTextStyle.swift
//  iOS-assignment
//

import UIKit

struct DottFont {
    
    // MARK: - Headers

    /// Gelion Bold 32 (hero)
    static let header0 = { () -> UIFont in
        let font = DottFontFamily.Gelion.bold.font(size: 32)
        let fontMetrics = UIFontMetrics(forTextStyle: .largeTitle)
        let scaledFont = fontMetrics.scaledFont(for: font)
        return scaledFont
    }()
    
    /// Gelion Bold 24 (title)
    static let header1 = { () -> UIFont in
        let font = DottFontFamily.Gelion.bold.font(size: 24)
        let fontMetrics = UIFontMetrics(forTextStyle: .title1)
        let scaledFont = fontMetrics.scaledFont(for: font)
        return scaledFont
    }()
    
    // MARK: - Labels

    /// Gelion Regular 16
    static let body = { () -> UIFont in
        let font = DottFontFamily.Gelion.regular.font(size: 16)
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        let scaledFont = fontMetrics.scaledFont(for: font)
        return scaledFont
    }()
    
    // MARK: - Buttons
    
    /// Gelion Medium 20
    static let ctaLabel = { () -> UIFont in
        let font = DottFontFamily.Gelion.medium.font(size: 20)
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        let scaledFont = fontMetrics.scaledFont(for: font)
        return scaledFont
    }()
    
}
