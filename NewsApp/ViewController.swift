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


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainFeed: UITableView!
    @IBOutlet weak var segmetedBar: MenuController!
    
    var articles: [Article] = []
    var link = "https://newsapi.org/v2/top-headlines?country=us&apiKey=aaa23d8c8eb04283b7a28e9b45bbc618"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainFeed.delegate = self
        mainFeed.dataSource = self
        
        Request.instance.getData(link: link) { (articles) in
            self.articles = articles
            self.mainFeed.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let clickableTitle = NSMutableAttributedString(string: articles[indexPath.item].title, attributes: [NSAttributedString.Key.link: URL(string: articles[indexPath.item].url)!])
        
        cell.title?.attributedText = clickableTitle
        cell.title?.font = UIFont.boldSystemFont(ofSize: 17.0)

        cell.source?.text = articles[indexPath.item].source
        cell.isLong?.isHidden = !articles[indexPath.item].isLong
        return cell
    }

}
