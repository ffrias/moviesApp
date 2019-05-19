//
//  Constants.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import Foundation

struct Constants{
    struct API{
        
        static let BaseUrl = "https://api.themoviedb.org/3/"
        static let BaseImagesUrl = "https://image.tmdb.org/t/p/w500/"
        
        
        static let popular = "movie/popular"
        static let topRated = "movie/top_rated"
        static let upcoming = "movie/upcoming"
        static let search = "search/movie"
    
}
    struct MovieDB{
        static let APIKey = "ab9dabaac6672703473f88d71b7451d0"
    }
}
