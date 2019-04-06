//
//  BookCollectionViewCell.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit
import SDWebImage

class BookCollectionViewCell: UICollectionViewCell {
    static let cellSize = CGSize(width: 150, height: 200)

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var book : Book? {
        didSet {
            titleLabel.text = book?.title
            coverImageView.sd_setImage(with: book?.coverURL, placeholderImage: UIImage(named:"placeholderBook"),
                                       options: .allowInvalidSSLCertificates, progress: nil, completed: nil)
        }
    }

}
