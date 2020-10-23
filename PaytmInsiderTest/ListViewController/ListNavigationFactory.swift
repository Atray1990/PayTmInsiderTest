//
//  ListNavigationFactory.swift
//  PaytmInsiderTest
//
//  Created by shashank atray on 22/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

/*
    Factory class to create new classes navigational value from here, same can be done for cart screen but didnt have much to navigate there.
 */

import Foundation
import UIKit

public protocol ListNavigatable {
    func makeListViewController(searchString: String, from navController: UINavigationController)
    func makeArtistDetailViewController(from navController: UINavigationController, selectedTest:Albums)
}

extension ListNavigatable { 
    public func makeListViewController(searchString: String, from navController: UINavigationController) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        let requestHandler = GetDataRequestHandler()
        let navigator = ListNavigatorRouting()
        let eventHandler = ListViewEventHandler.init(viewController: viewController, requestHandler: requestHandler, navigator: navigator)
        eventHandler.fetchChatdata(searchText: searchString)
        viewController.eventHandler = eventHandler
        navController.pushViewController(viewController, animated: true)
    }
    
    public func makeArtistDetailViewController(from navController: UINavigationController, selectedTest:Albums) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ArtistDetailViewController") as! ArtistDetailViewController
        viewController.artistAlbum = selectedTest
       /* let navigator = CountryNavigatorRouting()
        let requestHandler = CountryRequestHandler()
        let eventHandler = CartEventHandler.init(viewController: viewController, requestHandler: requestHandler, navigator: navigator)
        viewController.eventHandler = eventHandler*/
        navController.pushViewController(viewController, animated: true)
    }
    


}

open class ListNavigatorRouting: ListNavigatable {
    public init() {
    }
}
