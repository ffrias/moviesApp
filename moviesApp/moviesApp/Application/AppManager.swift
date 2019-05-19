//
//  AppManager.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import UIKit

class AppManager: NSObject {
    static let sharedInstance = AppManager()
    
    fileprivate override init() {}
    
    func presentMovieDetailScreen(_ actualViewController: UIViewController, movie: Movie){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let MovieDetailViewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        MovieDetailViewController.setMovie(movie: movie)
        actualViewController.navigationController?.pushViewController(MovieDetailViewController, animated: true)
    }

}
