//
//  ViewController.swift
//  GMMusic
//
//  Created by David M on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    var songs: [Song]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txtArtist: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBAction func pressSearch(_ sender: Any) {
        let queue = DispatchQueue.main
        spinner.isHidden = false
        spinner.startAnimating()
        let dataCallback = { [weak self] (songs: SongList?) in
            DispatchQueue.main.async {
                self?.spinner.isHidden = true
                self?.tableView.isHidden = false
                self?.songs = songs?.results
                self?.tableView.reloadData()

            }
        }
        FetchArtist.shared.getArtist(artist: txtArtist.text ?? "", queue: queue, callback: dataCallback)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as? SongCell
        cell?.configure(song: songs![indexPath.row] )
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    
}


