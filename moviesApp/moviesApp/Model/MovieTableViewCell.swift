//
//  MovieTableViewCell.swift
//  moviesApp
//
//  Created by Federico Frias on 19/05/2019.
//  Copyright © 2019 ffrias. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(title: String, imgPath: String){
        movieTitle.text = title
        
        let fullImgUrl = Constants.API.BaseImagesUrl + imgPath
        
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
                        imageCache.add(response.result.value!, for: URLRequest, withIdentifier: title)
                    }else{
                        print("Error: " + String(describing: response.result.error))
                    }
            }
            )
            
            movieImage!.layer.cornerRadius = movieImage.frame.size.width / 2
            movieImage!.clipsToBounds = true
        }
    }
    
    override func prepareForReuse() {
        movieTitle.text = nil
    }
}
