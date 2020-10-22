//
//  ViewController.swift
//  FlickerUIViewProject
//
//  Created by shashank atray on 08/08/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    
    let navigator = ListNavigatorRouting()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonClicked() {
        if searchTextField.text!.isEmpty {
            showAlertForEmpty()
        } else {
            if let navController = self.navigationController, let searchString = searchTextField.text {
                navigator.makeListViewController(searchString: searchString , from: navController)
            }
        }
    }
    
    func showAlertForEmpty() {
           let alert = UIAlertController(title: "Title", message: "Please Select an artist you want to search.", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
               print("User click Dismiss button")
           }))
           self.present(alert, animated: true, completion: {
               print("completion block")
           })
       }
}


