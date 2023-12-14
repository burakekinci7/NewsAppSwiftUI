//
//  PersistenceController.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//

import Foundation
import CoreData

class PersistenceController {
    let container = NSPersistentContainer(name: "News")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load : \(error.localizedDescription)")
            }
        }
    }
}
