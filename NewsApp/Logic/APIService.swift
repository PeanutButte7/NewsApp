//
//  APIService.swift
//  NewsApp
//
//  Created by Adam on 27/01/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIService {
    static let instance = APIService()
    
    private init() {}
    
    public func getMainFeed() -> [String]{
        var articles: [String] = []
        Alamofire.request("https://newsapi.org/v2/everything?q=bitcoin&from=2020-01-20&sortBy=publishedAt&apiKey=aac8b12d181842dcb932dc9d0d657b41").responseJSON { (response) in
            let json = try! JSON(data:response.data!)
            
            for i in json["articles"].arrayValue {
                articles.append(i["title"].stringValue)
            }
        }
        
        return articles
    }
}
