//
//  RequestsViewController.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/4/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var tvShowsTableView: UITableView!
    
    let searchRepository = SearchRepository()
    var moviesTableViewDelegate: RequestsTableViewDelegate?
    var tvShowsTableViewDelegate: RequestsTableViewDelegate?
    
    let CellReuseIdentifier = "CellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableViewDelegate = RequestsTableViewDelegate(tableView: moviesTableView)
        tvShowsTableViewDelegate = RequestsTableViewDelegate(tableView: tvShowsTableView)
    }
    
    @IBAction func editingChanged(textField: UITextField) {
        let query = textField.text!
        searchRepository.searchMovies(query) { (movies) in
            self.moviesTableViewDelegate!.requests = movies
        }
        searchRepository.searchTV(query) { (tvShows) in
            self.tvShowsTableViewDelegate!.requests = tvShows
        }
    }

}
