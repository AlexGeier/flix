//
//  Fetch.swift
//  Flix
//
//  Created by Alex Geier on 1/27/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import Foundation

func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
    guard let url = URL(string: urlString) else {
        completion(.failure(FetchError.badURL))
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, res, err) in
        if let err = err {
            completion(.failure(FetchError.API))
            return
        }
        
        guard let data = data else {
            completion(.failure(FetchError.noData))
            return
        }
        
        do {
            print(String(data: data, encoding: String.Encoding.utf8))
            let jsonData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(jsonData))
        } catch {
            completion(.failure(FetchError.decode))
        }
    }.resume()
}
