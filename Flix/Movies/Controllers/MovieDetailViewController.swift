//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by Alex Geier on 1/27/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit
import TinyConstraints

class MovieDetailViewController: UIViewController {
    private let backdropImage: UIImageView = {
        let image = UIImageView()
        
        return image
    }()
    private let posterImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        
        return image
    }()
    private let overviewlabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        
        overviewlabel.text = movie.overview
        posterImage.sd_setImage(with: movie.posterURL)
        backdropImage.sd_setImage(with: movie.backdropURL)
        navigationItem.title = movie.title
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    private func setupLayout() {
        let horizontalStackView = UIStackView(arrangedSubviews: [
            posterImage,
            overviewlabel
        ])
        horizontalStackView.alignment = .top
        horizontalStackView.spacing = 8
        
        posterImage.heightToWidth(of: horizontalStackView, multiplier: 40 / 27 / 3)
        posterImage.widthToSuperview(multiplier: 1 / 3)
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            backdropImage,
            horizontalStackView
        ])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        view.addSubview(verticalStackView)
        verticalStackView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
