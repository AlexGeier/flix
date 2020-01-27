//
//  MoviesViewController.swift
//  Flix
//
//  Created by Alex Geier on 1/17/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    private let cellId = "cellId"
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
                
        MovieService.shared.fetchPopularMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MovieCell
        cell.movie = movies[indexPath.row]
        
        return cell
    }
}

