//
//  PosterCell.swift
//  Flix
//
//  Created by Alex Geier on 2/1/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit
import SDWebImage
import TinyConstraints

class PosterCell: UICollectionViewCell {
    override var isHighlighted: Bool {
        didSet {
            posterImage.alpha = isHighlighted ? 0.8 : 1
        }
    }
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    var movie: Movie! {
        didSet {
            posterImage.sd_setImage(with: movie.posterURL)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(posterImage)
        posterImage.aspectRatio(27 / 40)
        posterImage.edgesToSuperview(insets: .init(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
