//
//  SearchRepository.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/4/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit

class SearchRepository: NSObject {

    func searchTV(query: String) -> [Request] {
        let requests = search(query)
        requests.forEach({ (request) -> () in
            request.name?.appendContentsOf(" tv!")
        })
        return requests
    }
    
    func searchMovies(query: String) -> [Request] {
        let requests = search(query)
        requests.forEach({ (request) -> () in
            request.name?.appendContentsOf(" movie!")
        })
        return requests
    }
    
    func search(query: String) -> [Request] {
        var requests:[Request] = []
        for _ in 1...10 {
            let request = Request()
            request.name = "hello!"
            requests.append(request)
        }
        return requests
    }
    
}
