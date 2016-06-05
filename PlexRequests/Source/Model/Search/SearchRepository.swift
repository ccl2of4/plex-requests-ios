//
//  SearchRepository.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/4/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class SearchRepository: NSObject {

    var tvRequest:Alamofire.Request?
    var movieRequest:Alamofire.Request?
    
    func searchTV(query: String, completion:[Request] -> Void) {
        let url = APIBaseUrl + "/tvshows"
        self.tvRequest?.cancel()
        self.tvRequest = Alamofire.request(.GET, url, parameters: ["query": query])
            .validate()
            .responseArray { (response: Response<[Request], NSError>) in
                if (response.result.error != nil) {
                    print(response.result.error)
                    return
                }
                let requests = response.result.value ?? []
                completion(requests)
        }
    }
    
    func searchMovies(query: String, completion:[Request] -> Void) {
        let url = APIBaseUrl + "/movies"
        self.movieRequest?.cancel()
        self.movieRequest = Alamofire.request(.GET, url, parameters: ["query": query])
            .validate()
            .responseArray { (response: Response<[Request], NSError>) in
                if (response.result.error != nil) {
                    print(response.result.error)
                    return
                }
                let requests = response.result.value ?? []
                completion(requests)
        }
    }
    
}
