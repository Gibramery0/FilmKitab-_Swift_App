//
//  Film.swift
//  FilmAramaSwiftUI
//
//  Created by Gibramery on 4.03.2025.
//

import Foundation

struct Film : Codable{
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
       case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}

struct GelenFilmler : Codable {
    let filmler : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
}
