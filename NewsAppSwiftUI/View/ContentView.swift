//
//  ContentView.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import SwiftUI

struct ContentView: View {
    //get view model
    @ObservedObject var newsViewmodel : NewsViewModel
    //category
    @State private var selectedCategory: Category = Category.business
    //country
    @State private var selectedCountry: Country = Country.au
 
    //initializer
    init() {
        self.newsViewmodel = NewsViewModel(newsService: NewsService())
    }
    
    var body: some View {
        
        NavigationStack{
            HStack{
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(Constants.Lists.categories, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                Picker("Conutries", selection: $selectedCountry) {
                    ForEach(Constants.Lists.countries, id: \.self) { country in
                        Text(country.rawValue).tag(country)
                    }
                }
                NavigationLink("BookMarks", destination: NewsBookMarks())
            }
            List (newsViewmodel.newsPublish?.articles ?? [], id: \.title){ article in
                NavigationLink(destination: NewsDetailsView(article: article)){
                    VStack{
                        AsyncImage(url: URL(string: article.urlToImage ?? "" ) ){image in
                            image
                                .resizable()
                                .padding()
                                .frame(maxHeight: UIScreen.main.bounds.height*0.3)
                        } placeholder: { ProgressView() }
                        Text(article.title)
                            .bold()
                            .fontWeight(.thin)
                        Text(article.description ?? "descp")
                        Text("- \(article.author ?? "Anonim")").italic()
                    }
                }
            }
            /*.onAppear {
                //Method 2. sync
                newsViewmodel.getNewsM2VM()
            }*/
            .task {
             //Method 1 async
                 fetchNewsSync(category: selectedCategory,country: selectedCountry)
            }
        }.onChange(of: (selectedCategory)) { oldValue, newValue in
            fetchNewsSync(category: newValue, country: selectedCountry)
        }
        .onChange(of: (selectedCountry)) { oldValue, newValue in
            fetchNewsSync(category: selectedCategory, country: newValue)
        }
    }
    
    private func fetchNewsSync(category: Category, country: Country) {
        Task {
            await newsViewmodel.getNewsM1VM(contry: country, category: category)
        }
    }
}

#Preview {
    ContentView()
}

