//
//  StringExtensions.swift
//  FirstSwift
//
//  Created by TCOM on 07/08/2023.
//
import SwiftUI

import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}

enum CustomFonts: String {
        case bold = "SVN-Aptimabold", medium = "VN-Aptima"
}

// font text
extension Font {
    static func custom(_ font: CustomFonts, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
