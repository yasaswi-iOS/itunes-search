//
//  ArtistDetails.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation

struct Response: Codable {
    let results: [ArtistDetails]
}

struct ArtistDetails: Codable {
    let artistName: String
    let trackName: String?
    let trackPrice: Float?
    let releaseDate: String
    let primaryGenreName: String
    let artworkUrl100: String
}
