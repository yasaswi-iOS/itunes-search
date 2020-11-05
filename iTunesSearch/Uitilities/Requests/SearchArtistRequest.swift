//
//  SearchArtistRequest.swift
//  iTunesSearch
//
//  Created by Yasaswi on 11/4/20.
//  Copyright © 2020 Yasaswi. All rights reserved.
//

import Foundation
enum SearchArtist {
    case getArtistList(user: String)
}

extension SearchArtist {
    var apiURL: String {
        switch self {
        case .getArtistList(let user):
            return "https://itunes.apple.com/search?term=\(user)&limit=25"
        }
    }
}


class SearchArtistRequest: BaseRequest {
    
    override init() {
        super.init()
        print (apiURL)
    }
    
}
