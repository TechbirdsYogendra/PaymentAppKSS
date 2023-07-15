//
//  PaymentAppKSSApp.swift
//  PaymentAppKSS
//
//  Created by Yogendra Singh on 15/07/23.
//

import SwiftUI

@main
struct PaymentAppKSSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    handleWidgetDeeplink(url: url)
                }
        }
    }
    
    func handleWidgetDeeplink(url: URL) {
        if let host = url.host, let type = WidgetButtonType(rawValue: host) {
            switch type {
            case .balance:
                print("Navigated to Balance Screen")
            case .pay:
                print("Navigated to Pay Screen")
            case .offers:
                print("Navigated to Offers Screen")
            case .history:
                print("Navigated to History Screen")
            }
        }
    }
}

enum WidgetButtonType: String {
    case balance
    case pay
    case offers
    case history
}
