//
//  Movie.swift
//  Flix
//
//  Created by Alex Geier on 1/27/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import Foundation

struct MovieResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    private let basePosterImageUrlString = "https://image.tmdb.org/t/p/w185"
    private let baseBackdropImageUrlString = "https://image.tmdb.org/t/p/w500"
    
    let title: String
    
    let overview: String
    
    let poster_path: String
    var posterURL: URL? {
        return URL(string: basePosterImageUrlString + poster_path)
    }
    
    let backdrop_path: String
    var backdropURL: URL? {
        return URL(string: baseBackdropImageUrlString + backdrop_path)
    }
    
    let release_date: String
}
