//
//  APICli.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class APICli{
    
    static let sharedInstance = APICli()
    fileprivate init(){}
    var movies: [Movie] = []
    var noFilteredMovies: [Movie] = []
    
    static let getMoviesNotification = "getMoviesNotification"
    
    enum Categories{
        case popular
        case topRated
        case upcoming
    }
    
    func getMovies(category: Categories){
        var URL:String = ""
        switch category {
            case .popular:
                URL = Constants.API.BaseUrl + Constants.API.popular
            
            case .topRated:
                URL = Constants.API.BaseUrl + Constants.API.topRated
            case .upcoming:
                URL = Constants.API.BaseUrl + Constants.API.upcoming
        }
        
        let params = [
            "api_key": Constants.MovieDB.APIKey
        ]
        
        Alamofire.request(URL, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<500)
            .responseArray(keyPath: "results") {(response: DataResponse<[Movie]>) in
                
                switch response.result {
                case .success:
                    self.movies = response.result.value ?? []
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getMoviesNotification"), object: nil)
        
                case .failure(let error):
                    print(error)
                }
        }
    }
    func searchMovies(searchQuery: String){
        
        //First I search for the movie in memory, if nothing matches the query I search online
        if (noFilteredMovies.isEmpty){
            noFilteredMovies = movies
        }
        
        let filteredMovies = movies.filter {
            ($0.title?.contains(searchQuery))!
        }
        
        if (!filteredMovies.isEmpty){
            movies = filteredMovies
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getMoviesNotification"), object: nil)
        }else{
            let URL = Constants.API.BaseUrl + Constants.API.search
            let params = [
                "api_key": Constants.MovieDB.APIKey,
                "query": searchQuery
            ]
            
            Alamofire.request(URL, method: .get, parameters: params, encoding: URLEncoding.default)
                .validate(statusCode: 200..<500)
                .responseArray(keyPath: "results") {(response: DataResponse<[Movie]>) in
                    
                    switch response.result {
                    case .success:
                        self.movies = response.result.value ?? []
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getMoviesNotification"), object: nil)
                        
                    case .failure(let error):
                        print(error)
                    }
            }
        }
    }
    
    func resetFilter(){
        movies = noFilteredMovies
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "getMoviesNotification"), object: nil)
    }
}
