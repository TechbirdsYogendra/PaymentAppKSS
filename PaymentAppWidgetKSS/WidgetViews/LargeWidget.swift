//
//  LargeWidget.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import SwiftUI
import WidgetKit

struct LargeWidgetView: View {
    var entry: SimpleEntry
    var body: some View {
        ZStack {
            entry.backgroundColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                if entry.shouldShowTitle {
                    Text("Payment App")
                }
                Spacer()
                HStack {
                    Spacer()
                    Link(destination: URL(string: "widget://balance")!) {
                        ButtonView(image: "indianrupeesign.circle", text: "Balance")
                    }
                    Spacer()
                    Link(destination: URL(string: "widget://pay")!) {
                        ButtonView(image: "camera.on.rectangle.fill", text: "Pay")
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Link(destination: URL(string: "widget://offers")!) {
                        ButtonView(image: "percent", text: "Offers")
                    }
                    Spacer()
                    Link(destination: URL(string: "widget://history")!) {
                        ButtonView(image: "list.bullet.rectangle.portrait.fill", text: "History")
                    }
                    Spacer()
                }
                Spacer()
            }
        }.foregroundColor(entry.textColor)
    }
}

struct LargeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LargeWidgetView(entry: SimpleEntry(date: Date(), textColor: .white, backgroundColor: .purple, shouldShowTitle: true))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

