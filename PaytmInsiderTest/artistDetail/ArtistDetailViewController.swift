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
    var artistAlbum: Albums!
    @IBOutlet weak var containerView:UIView!
    private var item: AVPlayerItem!
       private var player: AVPlayer!
       internal private(set) var playerVC: AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        playVideoSnippet()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func playVideoSnippet() {
        let videoURL = URL(string: artistAlbum.previewUrl! )
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.frame = self.containerView.bounds
        self.containerView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func setUp() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popBack))
        navigationItem.title = "Search Artist/Song"
    }
    
    @objc func popBack() {
          self.navigationController?.popViewController(animated: true)
    }
    
}
