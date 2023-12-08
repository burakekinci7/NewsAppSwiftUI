//
//  NewsAppSwiftUIApp.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import SwiftUI

@main
struct NewsAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
