//
//  ButtonView.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import SwiftUI

struct ButtonView: View {
    var image: String
    var text: String
    var body: some View {
        VStack {
            Image(systemName: image)
                .renderingMode(.original)
                .font(.title2)
                .padding(5)
            Text(text)
                .font(.body)
        }
    }
}

