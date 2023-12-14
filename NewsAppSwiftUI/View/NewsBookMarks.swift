//
//  NewsBookMarks.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//

import SwiftUI

struct NewsBookMarks: View {
    //Core Date
    @Environment(\.managedObjectContext) var managementObject
    // fetch data from database (core date)
    // sortDescriptors -> Sorts the data. If it is empty, not sort
    // FetchedResults<EntityName> -> return is list
    @FetchRequest(sortDescriptors: []) var newsEntity : FetchedResults<NewsEntity>
    var body: some View {
        List {
            ForEach(newsEntity){news in
                VStack{
                    //image
                    AsyncImage(url: URL(string: news.image ?? "" ) ){image in
                        image   .resizable()
                                .frame(maxHeight: UIScreen.main.bounds.height*0.3)
                                .padding(.top, 20)
                    } placeholder: { ProgressView() }
                    Text(news.title  ?? "Title").bold()
                    Text(news.reporter ?? "Content").padding(.vertical, 10)
                    Text(news.content ?? "reporter").italic()
                    Text(news.date ?? "Not Date").italic()
                }
            }
        }
    }
}

#Preview {
    NewsBookMarks()
}
