//
//  ServiceClient.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 23/03/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import Foundation

protocol ServiceClient {

    func getAuthors(withNameLike nameQuery: String, callback: @escaping ([Author]?, ServiceError?)-> Void)
    
    func getBooks(by author: Author?, callback: @escaping([Book]?, ServiceError?) -> Void) -> Void

}

fileprivate let _serviceClient = AlamofireServiceClient();

func getServiceClient() -> ServiceClient {
    return _serviceClient;
}
