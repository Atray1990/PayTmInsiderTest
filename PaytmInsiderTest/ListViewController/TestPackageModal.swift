//
//  TestPackageModal.swift
//  PaytmInsiderTest
//
//  Created by shashank atray on 22/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit


public struct TestPackage : Decodable  {
    let results: [Albums]
    let resultCount: Int
    
    // making not necessary values as optional as some data modal doesnt have them plus want to use same modal for core data
    
}

public struct Albums : Decodable {
    let wrapperType: String?
    let kind: String
    let artistId: Int?
    let trackViewUrl: String?
    let artistName: String
    let artistViewUrl: String?
    let artworkUrl100: String
    let artworkUrl30: String?
    let artworkUrl60: String?
    let collectionCensoredName: String?
    let collectionName: String?
    let collectionId: Int?
    let collectionPrice: Double
    let collectionViewUrl: String?
    let contentAdvisoryRating: String?
    let country: String?
    let currency: String?
    let previewUrl: String?
    let primaryGenreName: String
    let releaseDate: String
    let trackCensoredName: String?
    let trackPrice: Double
    let trackName: String
    let trackTimeMillis: Int
}

