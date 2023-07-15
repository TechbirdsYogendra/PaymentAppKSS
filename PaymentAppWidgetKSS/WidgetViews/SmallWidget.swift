//
//  SmallWidget.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import SwiftUI

import SwiftUI
import WidgetKit


struct SmallWidgetView: View {
    var entry: SimpleEntry
    var body: some View {
        ZStack {
            entry.backgroundColor
                .ignoresSafeArea()
            VStack {
                if entry.shouldShowTitle {
                    Text("Payment App")
                }
                Link(destination: URL(string: "widget://pay")!) {
                    ButtonView(image: "camera.on.rectangle.fill", text: "Scan & Pay")
                }
            }
        }.foregroundColor(entry.textColor)
    }
}

struct SmallWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidgetView(entry: SimpleEntry(date: Date(), textColor: .white, backgroundColor: .purple, shouldShowTitle: true))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
