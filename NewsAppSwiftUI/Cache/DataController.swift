//
//  DataController.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    //name is NewsCoreDataCache.xcdatamodeld (Data Model )
    let container = NSPersistentContainer(name: "NewsCoreDataCache")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("failed to load data : \(error)")
            }
        }
    }
    
    func save (context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!!!")
        }catch{
            print("Not save data")
        }
    }
    
    //create new object (news) and save
    func addToNews(content: String, date: String, image: String, reporter: String, title: String, context: NSManagedObjectContext ){
        let newsEntity = NewsEntity(context: context)
        newsEntity.id = UUID()
        newsEntity.content = content
        newsEntity.date = date
        newsEntity.image = image
        newsEntity.title = title
        newsEntity.reporter = reporter
        save(context: context)
    }
}
