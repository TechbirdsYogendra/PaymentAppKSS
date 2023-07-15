//
//  TextColor+Extention.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import Foundation
import SwiftUI

extension TextColor {
    var txtColor: Color {
        switch self {
        case .white:
            return Color.white
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .yellow:
            return Color.yellow
        default:
            return .gray
        }
    }
}

