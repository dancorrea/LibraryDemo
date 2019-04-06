//
//  BookViewController.swift
//  LibraryDemo
//
//  Created by FIBBAURU on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit
import SDWebImage

class BookViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    let book: Book
    
    init(book: Book) {
        self.book = book
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Não usar")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = book.title
        coverImageView.sd_setImage(
            with: book.coverURL,
            placeholderImage: UIImage(named: "placeholderBook"),
            options: .allowInvalidSSLCertificates,
            completed: nil)
        
        titleLabel.text = book.title
        authorLabel.text = NSLocalizedString("Autor:", comment: "") + (book.author?.name ?? "")
        quantityLabel.text = NSLocalizedString("Quantidade:", comment: "") + (book.quantity?.description ?? "0")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
