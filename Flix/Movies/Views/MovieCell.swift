//
//  MovieCell.swift
//  Flix
//
//  Created by Alex Geier on 1/27/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit
import SDWebImage
import TinyConstraints

class MovieCell: UITableViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .preferredFont(forTextStyle: .title1)
        
        return label
    }()
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0

        return label
    }()
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            posterImage.sd_setImage(with: movie.posterURL)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupLayout()
    }
    
    fileprivate func setupLayout() {
        let verticalStackView = UIStackView(arrangedSubviews: [
            titleLabel,
            overviewLabel,
            UIView()
        ])
        verticalStackView.axis = .vertical
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
            posterImage,
            verticalStackView
        ])
        horizontalStackView.spacing = 8
        
        posterImage.heightToWidth(of: horizontalStackView, multiplier: 40 / 27 / 3)
        posterImage.widthToSuperview(multiplier: 1 / 3)
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.edgesToSuperview(insets: .init(top: 8, left: 16, bottom: 8, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
