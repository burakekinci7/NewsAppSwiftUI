//
//  News+CoreDataProperties.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension News : Identifiable {

}
