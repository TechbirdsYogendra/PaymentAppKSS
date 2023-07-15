//
//  PaymentAppWidgetKSS.swift
//  PaymentAppWidgetKSS
//
//  Created by Yogendra Singh on 15/07/23.
//

import WidgetKit
import SwiftUI

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), textColor: .white, backgroundColor: .yellow, shouldShowTitle: true)
    }

    func getSnapshot(for configuration: PaymentWidgetIntentIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), textColor: .white, backgroundColor: .yellow, shouldShowTitle: true)
        completion(entry)
    }

    func getTimeline(for configuration: PaymentWidgetIntentIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let entry = SimpleEntry(date: currentDate, textColor: configuration.textColor.txtColor, backgroundColor: configuration.bgColor.backgroundColor, shouldShowTitle: (configuration.shouldShowTitle != nil))
        entries.append(entry)
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let textColor: Color
    let backgroundColor: Color
    let shouldShowTitle: Bool
}

struct PaymentAppWidgetKSSEntryView : View {
    var entry: SimpleEntry
    var body: some View {
        SmallWidgetView(entry: entry)
    }
}

struct WidgetView : View {
    let entry: SimpleEntry
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidgetView(entry: entry)
        case .systemMedium:
            MediumWidgetView(entry: entry)
        case .systemLarge:
            LargeWidgetView(entry: entry)
        default:
            LargeWidgetView(entry: entry)
        }
    }
}

@main
struct PaymentAppWidgetKSS: Widget {
    let kind: String = "com.yogendrasingh.PaymentAppKSS.PaymentAppWidgetKSS"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PaymentWidgetIntentIntent.self, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Payment Widget")
        .description("This is an example widget for KSS.")
    }
}

struct PaymentAppWidgetKSS_Previews: PreviewProvider {
    static var previews: some View {
        PaymentAppWidgetKSSEntryView(entry: SimpleEntry(date: Date(), textColor: .white, backgroundColor: .yellow, shouldShowTitle: true))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
