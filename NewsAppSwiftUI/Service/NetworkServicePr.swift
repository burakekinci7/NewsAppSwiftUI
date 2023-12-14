//
//  NetworkServicePr.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 12.12.2023.
//

import Foundation

protocol NetworkServicePr {
    ///M1 and M2 do the same job
    
    //M1
    func getNews (url: URL) async throws -> News
    
    //M2
    func getNewsEscaping (completion: @escaping  (Result<News?, NetError>) -> Void )
}
