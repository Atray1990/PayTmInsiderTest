//
//  ViewController.swift
//  FlickerUIViewProject
//
//  Created by shashank atray on 08/08/20.
//  Copyright © 2020 shashank atray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let navigator = ListNavigatorRouting()

       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
       @IBAction func buttonClicked() {
           if let navController = self.navigationController {
            navigator.makeListViewController(from: navController)
           }
       }
}


