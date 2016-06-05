//
//  RequestsViewController.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/4/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var tvShowsTableView: UITableView!
    let searchRepository = SearchRepository()
    var movies:[Request]?
    var tvShows:[Request]?
    
    let CellReuseIdentifier = "CellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moviesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        self.tvShowsTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
    }
    
    @IBAction func editingChanged(textField: UITextField) {
        let query = textField.text!
        searchRepository.searchMovies(query) { (movies) in
            self.movies = movies
            self.moviesTableView.reloadData()
        }
        searchRepository.searchTV(query) { (tvShows) in
            self.tvShows = tvShows
            self.tvShowsTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.moviesTableView) {
            return self.movies?.count ?? 0
        } else if (tableView == self.tvShowsTableView) {
            return self.tvShows?.count ?? 0
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier, forIndexPath: indexPath)
        var request:Request?;
        if (tableView == self.moviesTableView) {
            request = self.movies?[indexPath.row]
        } else if (tableView == self.tvShowsTableView) {
            request = self.tvShows?[indexPath.row]
        }
        
        cell.textLabel?.text = request?.name
        
        return cell
    }

}
