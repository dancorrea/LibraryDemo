//
//  AuthorTableViewCell.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 23/03/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {
    static let alturaCelula: CGFloat = 80

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var author: Author? {
        didSet {
            nameLabel.text = author?.name
            ageLabel.text = author?.objectId
        }
    }
    
}
