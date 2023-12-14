//
//  NewsCoreQwewe+CoreDataProperties.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//
//

import Foundation
import CoreData


extension NewsCoreQwewe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCoreQwewe> {
        return NSFetchRequest<NewsCoreQwewe>(entityName: "NewsCoreQwewe")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension NewsCoreQwewe : Identifiable {

}
