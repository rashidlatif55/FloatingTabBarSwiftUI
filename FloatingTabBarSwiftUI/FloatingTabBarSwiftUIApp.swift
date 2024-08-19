//
//  FloatingTabBarSwiftUIApp.swift
//  FloatingTabBarSwiftUI
//
//  Created by Rashid Latif on 19/08/2024.
//

import SwiftUI

@main
struct FloatingTabBarSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
