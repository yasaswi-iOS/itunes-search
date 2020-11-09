//
//  ArtistDetailTableViewCell.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import UIKit

class ArtistDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreNameLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(detail: ArtistDetails) {
        nameLabel.text = detail.artistName
        trackNameLabel.text = detail.trackName ?? "--"
        trackPriceLabel.text = String(describing: detail.trackPrice ?? 0)
        releaseDateLabel.text = detail.releaseDate.getDate()
        genreNameLabel.text = detail.primaryGenreName
        let url = URL(string: detail.artworkUrl100)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageview.image = UIImage(data: data!)
            }
        }
    }

}
