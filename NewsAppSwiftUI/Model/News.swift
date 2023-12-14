//
//  News.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 9.12.2023.
//

import Foundation

//   let news = try? JSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date //transform
    let content: String?
    
    //date format because swift can't read(decode) Date
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Bu format, örnek JSON'daki tarih formatına uyarlanmıştır. Gerekirse ayarlayabilirsiniz.
        return formatter
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}


