//
//  ListViewController.swift
//  PaytmInsiderTest
//
//  Created by shashank atray on 22/10/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//  LinkeIn - https://www.linkedin.com/in/shashank-k-atray/
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    // lazy var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 10, y: 5, width: 250, height: 25))
    @IBOutlet weak var searchBar:UISearchBar!

    let collectionDataSource = CollectionViewDataSource()
    var eventHandler: ListViewEventHandler!
    var artistAlbum: [Albums] = []
    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        collectionViewSetUp(count: 2)
        if let search = searchText {
             eventHandler.fetchChatdata(searchText: search)
        }
       
    }
    
    func setUpViews() {
        searchBar.placeholder = "search image"
        searchBar.delegate = self
        
        self.collectionView.dataSource = collectionDataSource
        self.collectionView.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "GridType", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(popBack))
        navigationItem.title = "Search Artist/Song"
    }
    
    // just for fun and to realign collection view as per need
    @objc func addTapped(){
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Show 2 per row", style: .default , handler:{ (UIAlertAction)in
            self.collectionViewSetUp(count: 2)
        }))
        
        alert.addAction(UIAlertAction(title: "Show 1 per row", style: .default , handler:{ (UIAlertAction)in
            self.collectionViewSetUp(count: 1)
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    
    
    func collectionViewSetUp(count: CGFloat) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        if count == 1 {
            layout.itemSize = CGSize(width: (self.view.frame.width - 20)/count, height: 180)
        } else {
            layout.itemSize = CGSize(width: (self.view.frame.width - 20)/count, height: (self.view.frame.width - 20)/count)
        }
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        self.collectionView.reloadData()
        collectionView!.collectionViewLayout = layout
        
    }
    
    func showAlbum(album: TestPackage, searchtext: String) {
        self.collectionDataSource.album = album.results
        self.artistAlbum = album.results
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func moveToArtistScreenScreen(testData: Albums) {
        if let navController = self.navigationController {
            eventHandler.moveToArtistDetailScreen(navController: navController, selectedTest: testData)
        }
    }
    
    @objc func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
// MARK:- delegates of search bar
extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 2 else {
            return
        }
        eventHandler.fetchChatdata(searchText: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text!.count > 2 else {
            return
        }
        eventHandler.fetchChatdata(searchText: searchBar.text!)
    }
    
}

// MARK:- delegate for collection view
extension ListViewController: UICollectionViewDelegate {
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(artistAlbum[indexPath.row])
        self.moveToArtistScreenScreen(testData: artistAlbum[indexPath.row])
        
    }
}


