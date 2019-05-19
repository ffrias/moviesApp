//
//  MovieDetailViewController.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreen()
        // Do any additional setup after loading the view.
    }
    
    func setMovie(movie: Movie){
        self.movie = movie
    }
    
    func setScreen(){
        movieTitle.text = movie.title
        releaseDate.text = movie.releaseDate
        rating.text = String(format:"Rating: %i ", movie.voteAverage!)
        overview.text = movie.overview
        
        let fullImgUrl = Constants.API.BaseImagesUrl + movie.posterPath!
        
        if let url = URL(string: fullImgUrl){
            let URLRequest = Foundation.URLRequest(url:url)
            let imageCache = AutoPurgingImageCache()
            
            movieImage!.af_setImage(
                withURL: url,
                placeholderImage: nil,
                filter: nil,
                imageTransition: .crossDissolve(0.5),
                completion: { response in
                    if (response.result.isSuccess){
                        imageCache.add(response.result.value!, for: URLRequest, withIdentifier: self.movie.title)
                    }else{
                        print("Error: " + String(describing: response.result.error))
                    }
                }
            )
        }
    }
}
