//
//  NewsCore+CoreDataProperties.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//
//

import Foundation
import CoreData


extension NewsCoreQ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCoreQ> {
        return NSFetchRequest<NewsCoreQ>(entityName: "NewsCore")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var id: UUID?
    @NSManaged public var images: Data?
    @NSManaged public var reporter: String?
    @NSManaged public var date: String?

}

extension NewsCoreQ : Identifiable {

}
