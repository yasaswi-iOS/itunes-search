//
//  ArtistDetailsViewController.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/5/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import UIKit

class ArtistDetailsViewController: UIViewController {

    @IBOutlet weak var artistDetailsTableView: UITableView!
    var details: [ArtistDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistDetailsTableView.dataSource = self
    }
}

extension ArtistDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellIdentifiers.kArtistDetailTableViewCell, for: indexPath) as? ArtistDetailTableViewCell
        if let cell = cell {
            cell.configureCell(detail: details[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
