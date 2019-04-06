//
//  AlamoFireServiceCient.swift
//  LibraryDemo
//
//  Created by fibbauru-14 on 23/03/19.
//  Copyright © 2019 FIB. All rights reserved.
//

import Foundation
import Alamofire
import EVReflection

class AlamofireServiceClient: ServiceClient {
    func getAuthors(withNameLike nameQuery: String, callback: @escaping ([Author]?, ServiceError?) -> Void) {
        GETRequest(type: Author.self, params: ["where":"name like '%\(nameQuery)%'"], callback: callback)
    }
    
    func getBooks(by author: Author?, callback: @escaping ([Book]?, ServiceError?) -> Void) {
        
        GETRequest(type: Book.self, params: ["where":"author.name like '%\(author?.name ?? "")%'"], callback: callback)
    }
    
    func GETRequest<T : BaseDTO>(type: T.Type, params: Parameters, callback: @escaping([T]?, ServiceError?) -> Void) {
        
        var allowedStatuses = Array<Int>(200..<300)
        allowedStatuses.append(contentsOf:400..<407)
        
        Alamofire.request(
            "https://api.backendless.com/00F19476-387E-3131-FFD6-EB5F1F72E100/38659E4B-1D33-06C9-FF05-272C81B2D200/data/" + String(describing : type),
            method: .get,
            parameters: params)
            .validate(statusCode: allowedStatuses)
            .responseData {
                response in
                switch(response.result) {
                case .success(let jsonData):
                    let jsonString = String(data: jsonData, encoding: .utf8)!
                    
                    if jsonString.contains("\"code\"") {
                        let errorResponse = ErrorResponse(json: jsonString)
                        callback(nil, ServiceError(code: .serviceFailed, message: errorResponse.message ?? "") )
                    } else {
                        let entries = [T] (json : jsonString)
                        callback(entries, nil)
                    }
                    
                case .failure(let error):
                    callback(nil, ServiceError(code: .unknown, message: error.localizedDescription, innerError : error))
                }
        }
    
    }
}
