//
//  SongCell.swift
//  GMMusic
//
//  Created by David M on 3/11/21.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var genreName: UILabel!
    @IBOutlet weak var trackPrice: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    //Initialize labels from song
    func configure(song: Song){
        songName.text = song.trackName
        let endOfTime = song.releaseDate.firstIndex(of: "T")!
        //Display just year-month-day
        releaseDate.text = String(song.releaseDate[..<endOfTime])
        artistName.text = song.artistName
        genreName.text = song.primaryGenreName
        trackPrice.text = "$" + String(song.trackPrice)
    }
    
}
