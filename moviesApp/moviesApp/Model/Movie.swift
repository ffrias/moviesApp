//
//  Movie.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import Foundation
import ObjectMapper

struct Movie:Mappable{
    var id: Int?
    var title: String?
    var voteAverage: Int?
    var overview: String?
    var releaseDate: String?
    var posterPath: String?
    
    
    init?(map: Map) {
        
    }
    
    init(id: Int, title: String, voteAverage: Int, overview: String, releaseDate: String, posterPath: String){
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        voteAverage <- map["vote_average"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
    }
    
    
}
