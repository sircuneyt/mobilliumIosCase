//
//  Cell.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//

import Foundation
import UIKit
import SDWebImage

class ShowCell: UITableViewCell {
    @IBOutlet weak var showPoster: UIImageView!
    @IBOutlet weak var showTitle: UILabel!
    @IBOutlet weak var showInfo: UILabel!
    @IBOutlet weak var showDate: UILabel!
   
    
    
    
    func configure(show: Show) {
    
        if let posterUrl = show.poster_path {
            showPoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500"+posterUrl))
        } else {
            showPoster.image = nil
        }
        if let title = show.title, let date = show.release_date , let overview = show.overview, let date = show.release_date {
            let dateList = date.components(separatedBy: "-")
            showTitle.text = title + " (\(dateList[0]))"
            showDate.text = date
            showInfo.text = overview
           
            
        }
        
        
    }
}


