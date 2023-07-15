//
//  MediumWidget.swift
//  PaymentAppWidgetKSSExtension
//
//  Created by Yogendra Singh on 15/07/23.
//

import SwiftUI
import WidgetKit

struct MediumWidgetView : View {
    var entry: Provider.Entry
    var body: some View {
        ZStack {
            entry.backgroundColor
                .ignoresSafeArea()
            VStack {
                if entry.shouldShowTitle {
                    Text("Payment App")
                }
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
                    Link(destination: URL(string: "widget://offers")!) {
                        ButtonView(image: "percent", text: "Offers")
                    }
                    Spacer()
                    Link(destination: URL(string: "widget://history")!) {
                        ButtonView(image: "list.bullet.rectangle.portrait.fill", text: "History")
                    }
                    Spacer()
                }
            }.foregroundColor(entry.textColor)
        }
    }
}

struct MediumWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidgetView(entry: SimpleEntry(date: Date(), textColor: .white, backgroundColor: .purple, shouldShowTitle: true))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

