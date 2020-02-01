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
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    private let posterImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .subheadline)
        
        return label
    }()
    private let overviewlabel: UITextView = {
        let label = UITextView()
        label.font = .preferredFont(forTextStyle: .body)
        
        return label
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        
        titleLabel.text = movie.title
        overviewlabel.text = movie.overview
        releaseDateLabel.text = movie.release_date
        posterImage.sd_setImage(with: movie.posterURL)
        backdropImage.sd_setImage(with: movie.backdropURL)
        
        navigationItem.title = movie.title
        navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    private func setupLayout() {
        let innerVerticalStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            releaseDateLabel
        ])
        innerVerticalStackView.axis = .vertical
        
        let spacer = UIView()
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
            spacer,
            innerVerticalStackView
        ])
        horizontalStackView.alignment = .top
        horizontalStackView.spacing = 8
        
        spacer.widthToSuperview(multiplier: 1 / 3)
        
        let wrapper = UIView()
        wrapper.addSubview(horizontalStackView)
        horizontalStackView.edgesToSuperview(insets: .init(top: 0, left: 8, bottom: 0, right: 8))
        
        let wrapper2 = UIView()
        wrapper2.addSubview(overviewlabel)
        overviewlabel.edgesToSuperview(insets: .init(top: 0, left: 8, bottom: 0, right: 8))
        
        let verticalStackView = UIStackView(arrangedSubviews: [
            backdropImage,
            wrapper,
            wrapper2
        ])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 8
        
        view.addSubview(verticalStackView)
        verticalStackView.edgesToSuperview(usingSafeArea: true)
        
        view.addSubview(posterImage)
        posterImage.left(to: spacer)
        posterImage.right(to: spacer)
        posterImage.bottomToTop(of: overviewlabel)
        posterImage.heightToWidth(of: view, multiplier: 40 / 27 / 3)
        posterImage.widthToSuperview(multiplier: 1 / 3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
