//
//  NewsAppSwiftUIApp.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import SwiftUI

@main
struct NewsAppSwiftUIApp: App {
    //dataController is core date required
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
