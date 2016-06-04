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
        self.movies = searchRepository.searchMovies(query)
        self.tvShows = searchRepository.searchTV(query)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier, forIndexPath: indexPath)
        cell.textLabel!.text = "hello!"
        return cell
    }

}
