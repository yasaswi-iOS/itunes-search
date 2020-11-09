//
//  ArtistDetailTableViewCellTest.swift
//  iTunesSearchTests
//
//  Created by Yasaswi on 11/9/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import XCTest
@testable import iTunesSearch

class ArtistDetailTableViewCellTest: XCTestCase {
    let cell = ArtistDetailTableViewCell()
    let nameLabel = UILabel()
    let trackNameLabel = UILabel()
    let trackPriceLabel = UILabel()
    let releaseDateLabel = UILabel()
    let genereNameLabel = UILabel()
    
    override func setUp() {
        cell.nameLabel = nameLabel
        cell.trackNameLabel = trackNameLabel
        cell.trackPriceLabel = trackPriceLabel
        cell.releaseDateLabel = releaseDateLabel
        cell.genreNameLabel = genereNameLabel
        cell.awakeFromNib()
    }
    
    func testConfigureCell() {
        let details = ArtistDetails(artistName: "name", trackName: "track", trackPrice: 10.0, releaseDate: "2020-11-05T10:44:00+0000", primaryGenreName: "primaryGenre", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Music118/v4/49/09/ff/4909ffd6-9051-c729-7761-3dfcc183333c/source/100x100bb.jpg")
        cell.configureCell(detail: details)
        XCTAssertEqual(cell.nameLabel.text, "name")
        XCTAssertEqual(cell.trackNameLabel.text, "track")
        XCTAssertEqual(cell.trackPriceLabel.text, "10.0")
        //XCTAssertEqual(cell.releaseDateLabel.text, "05-11-2020 05:44:00")
        XCTAssertEqual(cell.genreNameLabel.text, "primaryGenre")
    }
}
