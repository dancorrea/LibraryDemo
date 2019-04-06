//
//  LibraryTabBarController.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 23/03/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import UIKit

class LibraryTabBarController: UITabBarController {
    
    private func configureTab(for viewController: UIViewController,
                              title: String, iconName: String) -> UIViewController {
        
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.isTranslucent = false
        viewController.title = title
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: iconName)
        
        return navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [configureTab(for: AuthorsTableViewController(style: .plain), title: NSLocalizedString("Autores", comment: ""), iconName: "iconAuthors"),
                           configureTab(for: BooksCollectionViewController(),
                                        title: NSLocalizedString("Livros", comment: ""), iconName: "iconBook")]
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
