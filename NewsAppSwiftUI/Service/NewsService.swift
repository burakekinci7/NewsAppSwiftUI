//
//  NewsService.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 11.12.2023.
//

import Foundation

class NewsService : NetworkServicePr{
    //The methods written are for learning.
    //It is enough to use just one
    
    ///Get News for api method1. This is used more
    func getNews (url: URL) async throws -> News{
      
        let (data, responce) = try await URLSession.shared.data(from: url)
        
        guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else { throw  NetError.invalidREsponceError
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Article.dateFormatter)
            return try decoder.decode(News.self, from: data)
        }catch {
            throw NetError.invalidData
        }
    }
    
    ///Get news method, with escaping annotaiton. Because i am learning webSerice methdo2
    func getNewsEscaping (completion: @escaping  (Result<News?, NetError>) -> Void ){
        
        guard let url = URL(string: Constants.Urls.shared.categoryUrl(contry: Country.us, category: Category.sports)) else { return completion(.failure(.invalidUrl)) }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let _ = error {
                completion(.failure(.invalidError))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.invalidData))
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(Article.dateFormatter)
            
            guard let news = try? decoder.decode(News.self, from: data) else {
                return completion(.failure(.invalidREsponceError))
            }
            completion(.success(news))
        }.resume()
    }
}

//Network Error 
enum NetError : Error{
    case invalidError
    case invalidREsponceError
    case invalidData
    case invalidUrl
}

