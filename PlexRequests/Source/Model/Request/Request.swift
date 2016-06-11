//
//  Request.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/4/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit
import ObjectMapper

class Request: Mappable {

    var requestId: String?
    var name: String?
    var date: String?
    var type: String?
    var comments: [Any]?
    var summary: String?
    var posterPath: String?
 
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name       <- map["name"]
        summary    <- map["summary"]
        posterPath <- map["poster_path"]
    }
    
}
