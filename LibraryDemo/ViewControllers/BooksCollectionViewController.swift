//
//  BooksCollectionViewController.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BooksCollectionViewController: UICollectionViewController {
    
    init(author: Author? = nil){
        self.author = author
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        author = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UINib(nibName: String(describing: BookCollectionViewCell.self),
                                            bundle: nil ) ,
                                      forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        collectionView!.refreshControl = UIRefreshControl()
        collectionView!.refreshControl?.addTarget(self, action: #selector(getBooks), for: .valueChanged)
        
        let flowLayout = collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = BookCollectionViewCell.cellSize
        flowLayout.minimumLineSpacing = 5
        
        collectionView!.backgroundColor = UIColor.groupTableViewBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBooks()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let serviceClient = getServiceClient()
    
    let  author: Author?
    
    var books: [Book]?
    
    @objc func getBooks() {
        ld_performAsync { [unowned self] (resolve) in
            self.serviceClient.getBooks(by: self.author)
            { (books, error) in
                self.books = books
                self.collectionView?.reloadData()
                self.collectionView?.refreshControl?.endRefreshing()
                resolve(error)
                
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return books?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCollectionViewCell
        
        // Configure the cell
        cell.book = books?[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(BookViewController(
            book: books![indexPath.row]), animated: true)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
