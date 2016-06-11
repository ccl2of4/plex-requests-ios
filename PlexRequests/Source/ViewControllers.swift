//
//  ViewControllers.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/11/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit

class ViewControllers: NSObject {

    class var requestsViewController: RequestsViewController {
        let requestsViewController = RequestsViewController()
        requestsViewController.title = "Request"
        return requestsViewController
    }
    
    class var existingRequestsViewController: ExistingRequestsViewController {
        let existingRequestsViewController = ExistingRequestsViewController()
        existingRequestsViewController.title = "View All"
        return existingRequestsViewController
    }
    
    class var tabBarController: UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [requestsViewController, existingRequestsViewController]
        return tabBarController
    }
    
}
