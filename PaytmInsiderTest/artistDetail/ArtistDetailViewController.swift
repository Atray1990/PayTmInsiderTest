//
//  ArtistDetailViewController.swift
//  PaytmInsiderTest
//
//  Created by shashank atray on 23/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ArtistDetailViewController: UIViewController {
    
    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var lblAlbumGenre: UILabel!
    @IBOutlet weak var lblAlbumDuration: UILabel!
    @IBOutlet weak var lblSongPrice: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblAlbumPrice: UILabel!
    @IBOutlet weak var lblkind: UILabel!
    
    var artistAlbum: Albums!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideoSnippet()
        setUp()
        setupWithData(album: artistAlbum)
        // Do any additional setup after loading the view.
    }
    
    func playVideoSnippet() {
        let videoURL = URL(string: artistAlbum.previewUrl! )
        let player = AVPlayer(url: videoURL!)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChild(playerController)
        self.containerView.addSubview(playerController.view)
        playerController.view.frame = self.containerView.frame
        playerController.showsPlaybackControls = true
        
        player.play()
    }
    
    func setUp() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popBack))
        navigationItem.title = "\(artistAlbum.trackName) by \(artistAlbum.artistName)"
    }
    
    @objc func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupWithData(album: Albums) {
        
        lblAlbumName.text = album.trackName
        lblArtistName.text = album.artistName
        lblAlbumGenre.text = "Genre : \(album.primaryGenreName)"
        lblSongPrice.text = "$\(album.trackPrice)"
        let time = String(format: "%.2f", album.trackTimeMillis.msToSeconds)
        lblAlbumDuration.text = "Duration: \(time) mins"
        lblAlbumPrice.text = "$\(album.collectionPrice)"
        lblkind.text = album.kind

        getDateFormat()
        
    }
    func getDateFormat() {
        let formater = ISO8601DateFormatter()
        
        formater.formatOptions = [.withFullDate]
        let date = formater.date(from: artistAlbum.releaseDate)
        if let dateValue = date {
            lblReleaseDate.text = "\(dateValue))"
        }
        //lblReleaseDate.text = "\(String(describing: date))"
    }
    
    
}


