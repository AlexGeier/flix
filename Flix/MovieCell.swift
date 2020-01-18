//
//  MovieCell.swift
//  Flix
//
//  Created by Alex Geier on 1/17/20.
//  Copyright © 2020 Alex Geier. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UITextView!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        synopsisLabel.isEditable = false
//        synopsisLabel.isSelectable = false
        synopsisLabel.textContainer.lineBreakMode = .byTruncatingTail
        let padding = synopsisLabel.textContainer.lineFragmentPadding
        synopsisLabel.isUserInteractionEnabled = false
        synopsisLabel.textContainerInset =  UIEdgeInsets(top: 0, left: -padding, bottom: -padding, right: -padding)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
