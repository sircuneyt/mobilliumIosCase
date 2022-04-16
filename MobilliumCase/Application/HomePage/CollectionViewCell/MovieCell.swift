//
//  MovieCell.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 15.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    
    
    
    func configure(show: Show) {
        if let posterUrl = show.backdrop_path {
            moviePoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500"+posterUrl))
        } else {
            moviePoster.image = nil
        }
        
        if let title = show.title, let date = show.release_date , let overview = show.overview {
            let dateList = date.components(separatedBy: "-")
            labelTitle.text = title + " (\(dateList[0]))"
            labelOverview.text = overview
           
            
        }
    }
}
