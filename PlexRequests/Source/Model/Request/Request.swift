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
 
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
    
}