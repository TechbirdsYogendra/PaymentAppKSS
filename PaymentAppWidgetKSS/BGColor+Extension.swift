//
//  BGColor+Extension.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import Foundation
import SwiftUI

extension BGColor {
    var backgroundColor: Color {
        switch self {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        case .white:
            return Color.white
        default:
            return .accentColor
        }
    }
}
