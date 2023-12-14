//
//  NewsViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 11.12.2023.
//

import Foundation


class NewsViewModel : ObservableObject{
    @Published var newsPublish : News?
    let newsService  : NetworkServicePr
    
    init( newsService: NetworkServicePr) {
        self.newsService = newsService
    }
    // SF1
    func getNewsM1VM (contry: Country,category: Category) async{
        
        do {
            let news = try await newsService.getNews(url: URL(string: Constants.Urls.shared.categoryUrl(contry: contry, category: category))!)
            DispatchQueue.main.async {
                self.newsPublish = news
            }
        }catch NetError.invalidData {
            print("invalid data")
        }catch NetError.invalidError {
            print("invalidError data")
        }catch NetError.invalidREsponceError {
            print("invalidREsponceError data")
        }catch {
            print("Error")
        }
    }
    
    // SF2
    func getNewsM2VM () {
        newsService.getNewsEscaping { result in
            switch result {
            case .failure(let error):
                print("getNewsM2VM result error: \(error)")
            case .success(let news):
                if let news = news {
                    DispatchQueue.main.async {
                        self.newsPublish = news
                    }
                }
            }
        }
    }
}
