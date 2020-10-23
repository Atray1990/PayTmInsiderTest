//
//  ListViewEventHandler.swift
//  TestProjectData
//
//  Created by shashank atray on 13/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import Foundation
import UIKit
import CoreData

open class ListViewEventHandler {
    
    weak var viewController: ListViewController?
    let navigator: ListNavigatorRouting
    let requestHandler: GetDataRequestHandler
    
    init(viewController: ListViewController, requestHandler: GetDataRequestHandler, navigator: ListNavigatorRouting) {
        self.viewController = viewController
        self.requestHandler = requestHandler
        self.navigator = navigator
    }
    
   func fetchChatdata(searchText: String) {
    let demoUrl = "https://itunes.apple.com/search?term=\(searchText)"
    if let url = URL(string: demoUrl.removingCharacters(from: .whitespacesAndNewlines)) {

        requestHandler.requestForUserDataWith(requestUrl: url) { result in
            self.viewController?.showAlbum(album: result, searchtext: searchText)
        }
    }
           
       }
    
    func moveToArtistDetailScreen(navController: UINavigationController, selectedTest:Albums) {
        navigator.makeArtistDetailViewController(from: navController, selectedTest: selectedTest)
        
    }
    
}
