//
//  UIViewController+Async.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 06/04/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import Foundation
import MBProgressHUD

extension UIViewController {
    func ld_performAsync(
        action: ( @escaping(Error?) -> Void) -> Void
        
        ) {
        MBProgressHUD.showAdded(to: view, animated: true)
        
        action { [weak self] error in
            if let strongSelf = self {
                MBProgressHUD.hide(for: strongSelf.view, animated : true)
            
            
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("Erro", comment: ""),
                                                        message: NSLocalizedString("Deu merda!", comment: ""),
                                                        preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK",
                                                        style: .default,
                                                        handler: nil))
                
                strongSelf.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

