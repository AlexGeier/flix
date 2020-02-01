//
//  MovieCollectionViewController.swift
//  Flix
//
//  Created by Alex Geier on 2/1/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit

class MovieCollectionViewController: UICollectionViewController {
    private let cellId = "cellId"
    private var movies = [Movie]()
    
    init() {
        let item = NSCollectionLayoutSupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.499), heightDimension: .estimated(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        super.init(collectionViewLayout: layout)
        
        collectionView.register(PosterCell.self, forCellWithReuseIdentifier: cellId)
        
        MovieService.shared.fetchSuperheroMovies { result in
            switch result {
            case .success(let movies):
                self.movies = movies
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PosterCell
        cell.movie = movies[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! PosterCell
        
        if let movie = cell.movie {
            navigationController?.pushViewController(MovieDetailViewController(movie: movie), animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
