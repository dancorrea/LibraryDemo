//
//  Book.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import Foundation

class Book: BaseDTO {
    var author : Author?
    var title: String?
    var cover: String?
    var quantity: Int?
    
    var coverURL:  URL? {
        return URL(string: cover ?? "")
    }
    
    
}
