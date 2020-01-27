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
    let title: String
    let overview: String
    let poster_path: String
}
