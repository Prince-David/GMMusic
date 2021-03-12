//
//  Song.swift
//  GMMusic
//
//  Created by David M on 3/11/21.
//

import Foundation
struct Song: Codable {
    var artistName: String
    var trackName: String
    var trackPrice: Double
    var releaseDate: String
    var primaryGenreName: String
}

struct SongList: Codable {
    var results: [Song]
}
