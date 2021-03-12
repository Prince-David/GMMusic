//
//  FetchArtist.swift
//  GMMusic
//
//  Created by David M on 3/11/21.
//

import Foundation
class FetchArtist{
    static let shared = FetchArtist()
    func getArtist(artist: String, queue: DispatchQueue = .main, callback: @escaping (SongList?) -> Void){
        let searchTerm = artist.replacingOccurrences(of: " ", with: "%20") //make artist searchable in URL
        let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            //Parse JSON response
            let songList =  (try? decoder.decode(SongList.self, from: data)) ?? nil
            
            
            queue.async {
                callback(songList)
            }
        }

        task.resume()
        
    }
    
}
