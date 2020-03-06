//
//  Request.swift
//  NewsApp
//
//  Created by Adam on 06/03/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

import SwiftyJSON
import Alamofire

class Request {
    static let instance = Request()
    private init() {}
    
    public func getData(link: String, onSuccess: @escaping ([Article]) -> ()) {

        var articles: [Article] = []
    
        Alamofire.request(link).responseJSON { (response) in
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
                
                articles.append(Article(title: i["title"].stringValue, source: i["source"]["name"].stringValue, perex: i["description"].stringValue, url: i["url"].stringValue, imageUrl: i["urlToImage"].stringValue, isLong: isLong))
            }
            onSuccess(articles)
        }
    }
}
