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
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainFeed.delegate = self
        mainFeed.dataSource = self
        Alamofire.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=aaa23d8c8eb04283b7a28e9b45bbc618").responseJSON { (response) in
            let json = try! JSON(data:response.data!)
            for i in json["articles"].arrayValue {
                var content = i["content"].stringValue
                var isLong = false
                
                if content.hasSuffix("chars]") { // Content has extra chars (is not short)
                    //gets number of extra characters in content
                    content.removeLast(7)
                    let index = content.lastIndex(of: "+") ?? content.endIndex
                    var extraChars = content[index...]
                    extraChars.removeFirst()
                    String(extraChars)
                    
                    if Int(extraChars) ?? -1 > 7000 { // Content is long
                        isLong = true
                    }
                }
                
                self.articles.append(Article(title: i["title"].stringValue, source: i["source"]["name"].stringValue, perex: i["description"].stringValue, url: i["url"].stringValue, imageUrl: i["urlToImage"].stringValue, isLong: isLong))
            }
            
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
        cell.isLong?.isHidden = articles[indexPath.item].isLong ? false : true
        return cell
    }

}
