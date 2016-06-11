//
//  RequestsTableViewDelegate.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/11/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit

class RequestsTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    private let CellReuseIdentifier = "CellReuseIdentifier"
    private let tableView: UITableView

    var requests: [Request]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib.init(nibName: "RequestTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let requests = self.requests {
            return requests.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier, forIndexPath: indexPath) as! RequestTableViewCell
        let request = requests?[indexPath.row]
        cell.request = request
        return cell
    }
    
}
