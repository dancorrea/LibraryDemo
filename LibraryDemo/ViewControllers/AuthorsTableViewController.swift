//
//  AuthorsTableViewController.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 23/03/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit
import MBProgressHUD

class AuthorsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UINib(nibName: String(describing: AuthorTableViewCell.self), bundle: nil), forCellReuseIdentifier: "authorCell")
        tableView.rowHeight = AuthorTableViewCell.alturaCelula;
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(getAuthors), for: UIControlEvents.valueChanged)
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAuthors()
    }
    
    let serviceClient = getServiceClient()
    
    @objc func getAuthors () {
        
        ld_performAsync { [unowned self] (resolve) in
            self.serviceClient.getAuthors(withNameLike: "")
            { (authors, error) in
                self.authors = authors
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
                resolve(error)
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //array de uma tupla
    //let authors: [(name: String, age: Int)] =
     //   [
       //     ("Marcelo", 31),
        //    ("Foo", 66),
          //  ("Bar", 33),
      //      (name: "Teste", age: 80)
    //]
    var authors: [Author]?
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //somente uma sessão na lista
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return authors?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "authorCell", for: indexPath) as! AuthorTableViewCell
        cell.author = authors?[indexPath.row]
        return cell
        
//        var cell = tableView.dequeueReusableCell(withIdentifier: "authorCell")
//
//        // Configure the cell...
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "authorCell")
//        }
//
//        cell?.accessoryType = .detailDisclosureButton
//        cell?.imageView?.image = UIImage(named: "iconAuhors")
//
//        let author = authors[indexPath.row]
//        cell?.textLabel?.text = author.name
//        cell?.detailTextLabel?.text = NSLocalizedString("Idade: ", comment: "") +
//            author.age.description //converte o Int para String o comando description
//        return cell!
        
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
