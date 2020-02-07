//
//  ViewController.swift
//  NewsApp
//
//  Created by Adam on 21/01/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-21&sortBy=publishedAt&apiKey=aaa23d8c8eb04283b7a28e9b45bbc618").

        // Do any additional setup after loading the view.
    }
}
