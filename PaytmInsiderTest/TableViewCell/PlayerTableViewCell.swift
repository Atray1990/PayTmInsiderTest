
//
//  collectionViewCell.swift
//  PaytmInsiderTest
//
//  Created by shashank atray on 22/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import UIKit


class collectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblArtistName: UILabel!
    @IBOutlet weak var ivAlbumImage: UIImageView!
    @IBOutlet weak var lblAlbumGenre: UILabel!
    @IBOutlet weak var lblAlbumDuration: UILabel!
    @IBOutlet weak var lblSongPrice: UILabel!
    @IBOutlet weak var viewContainer: UIView!
        
    var imageLoader = ImageLoader()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellSetup() {  // this can be created in seperate extention to be reused as desired
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: viewContainer.layer.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
        ivAlbumImage.layer.cornerRadius = 2
    }
    
    func setupWithPhoto(album: Albums) {
        cellSetup()
        lblAlbumName.text = album.trackName
        lblArtistName.text = album.artistName
        lblAlbumGenre.text = "Genre : \(album.primaryGenreName)"
        lblSongPrice.text = "Buy for : $\(album.trackPrice)"
        let time = String(format: "%.2f", album.trackTimeMillis.msToSeconds)
        lblAlbumDuration.text = "Duration: \(time) mins"
        
        imageLoader.obtainImageWithPath(imagePath: album.artworkUrl100) { (image) in
            self.ivAlbumImage.image = image
        }
    }
}
