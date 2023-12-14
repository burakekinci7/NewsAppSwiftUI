//
//  NewsCoreQwe+CoreDataProperties.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//
//

import Foundation
import CoreData


extension NewsCoreQwe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCoreQwe> {
        return NSFetchRequest<NewsCoreQwe>(entityName: "NewsCoreQwe")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension NewsCoreQwe : Identifiable {

}
