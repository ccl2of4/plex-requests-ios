//
//  RequestTableViewCell.swift
//  PlexRequests
//
//  Created by Connor Lirot on 6/11/16.
//  Copyright © 2016 Connor Lirot. All rights reserved.
//

import UIKit
import Haneke

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var request: Request? {
        didSet {
            update()
        }
    }
    
    override func prepareForReuse() {
        request = nil
    }

    private func update() {
        titleLabel.text = request?.name
        summaryLabel.text = request?.summary
        
        if let posterPath = request?.posterPath, posterURL = NSURL(string:posterPath) {
            posterImageView.hnk_setImageFromURL(posterURL)
        } else {
            posterImageView.image = nil
        }
    }

    
}
