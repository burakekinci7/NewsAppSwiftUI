//
//  NewsDetailsView.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 11.12.2023.
//

import SwiftUI

struct NewsDetailsView: View {
    var article : Article?
    init(article: Article? = nil) {
        self.article = article
    }
    //allowing interaction with the application's database.
    //tr- uygulamanın db ye erişmesine olnak tanır
    @Environment(\.managedObjectContext) var managementObject
    
    //Exit the scrren tr- sayfadan cıkmak icin kullanırlı
    @Environment(\.dismiss) var dismis
    
    @State private var name = ""
    
    var body: some View {
        VStack (alignment: .center){
            //image
            AsyncImage(url: URL(string: article?.urlToImage ?? "" ) ){image in
                image   .resizable()
                        .frame(maxHeight: UIScreen.main.bounds.height*0.3)
                        .padding(.top, 20)
            } placeholder: { ProgressView() }
            Text(article?.title ?? "Title").bold()
            Text(article?.content ?? "Content").padding(.vertical, 10)
            Text(article?.author ?? "reporter").italic()
            Text(article?.publishedAt.formatted() ?? "Not Date").italic()
            Spacer()
            Button {
                //Save to a news
                DataController().addToNews(content: article?.content ?? "Contet", date: article?.publishedAt.formatted() ?? "Not Date", image: article?.urlToImage ?? "", reporter: article?.author ?? "reporter", title: article?.title ?? "Title", context: managementObject)
                dismis()
            } label: {
                Image(uiImage: .actions)
            }.padding(.bottom, 20)
                
            //Goto news website
            Link("Habere Git", destination: (URL(string: article?.url ?? "") ?? URL(string: "https://www.google.com/"))!)
        }.navigationTitle(article?.source.name ?? "Glovbal News").padding(.horizontal, 20)
    }
}

#Preview {
    NewsDetailsView()
}
