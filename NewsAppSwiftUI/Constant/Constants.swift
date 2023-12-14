//
//  Constants.swift
//  NewsAppSwiftUI
//
//  Created by Ramazan Burak Ekinci on 9.12.2023.
//

import Foundation

struct Constants {
    struct Urls {
        // category -> business, entertainment, general, health, science, sports, technology
        //conunty   -> au, ca, ch, nl, be, de, fr, mx, us, rs, sa, ru, it, br, pl, tr
        static let shared = Urls()
        
        static let baseurl : String = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2fd313b3eccc4d20a2804aac5ff28168"
        
        func categoryUrl(contry : Country, category: Category) -> String {
            return "https://newsapi.org/v2/top-headlines?country=\(contry.rawValue)&category=\(category.rawValue)&apiKey=2fd313b3eccc4d20a2804aac5ff28168"
        }
    }
    
    struct Lists {
        static let categories = [ Category.business,Category.entertainment,Category.general,Category.health,Category.science,Category.sports,Category.technology
            ]
        
        static let countries = [
            Country.au,Country.be,Country.br,Country.ca,Country.ch,Country.de,Country.fr,Country.it,Country.mx,Country.nl,Country.tr,Country.us
            ]
    }
}

enum Country : String{
    case au
    case ca
    case ch
    case nl
    case be
    case de
    case fr
    case mx
    case us
    case rs
    case sa
    case ru
    case it
    case br
    case pl
    case tr
}

enum Category : String {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}
