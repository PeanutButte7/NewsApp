//
//  Article.swift
//  NewsApp
//
//  Created by Adam on 28/01/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

class Article {
    var title: String
    var source: String
    var perex: String
    var isLong: Bool
    var url: String
    var imageUrl: String
    
    init(title: String, source: String, perex: String, url: String, imageUrl: String, isLong: Bool) {
        self.title = title
        self.source = source
        self.perex = perex
        self.url = url
        self.imageUrl = imageUrl
        self.isLong = isLong
    }
}
