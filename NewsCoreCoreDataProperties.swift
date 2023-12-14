//
//  NewsCore+CoreDataProperties.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//
//

import Foundation
import CoreData


extension NewsCoreM {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCoreM> {
        return NSFetchRequest<NewsCoreM>(entityName: "NewsCore")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: String?
    @NSManaged public var id: UUID?
    @NSManaged public var images: Data?
    @NSManaged public var reporter: String?
    @NSManaged public var title: String?

}

extension NewsCoreM : Identifiable {

}
