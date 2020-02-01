//
//  MovieService.swift
//  Flix
//
//  Created by Alex Geier on 1/27/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    
    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        fetchJSON(urlString: urlString, completion: { (result: Result<MovieResults, Error>) in
            switch result {
            case .success(let movieResults):
                completion(.success(movieResults.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func fetchSuperheroMovies(completion: @escaping (Result<[Movie], Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        fetchJSON(urlString: urlString, completion: { (result: Result<MovieResults, Error>) in
            switch result {
            case .success(let movieResults):
                completion(.success(movieResults.results))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
