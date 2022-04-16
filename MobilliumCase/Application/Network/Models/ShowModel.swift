//
//  ShowModel.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 13.04.2022.
//

import Foundation

class ShowModelNowPlaying: Decodable {
    var page: Int?
    var results: [Show?]?
    var totalPages: Int?
    var totalResults: Int?
  
    
   
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
        
    
    }
    
    init(page: Int?, results: [Show?]?, totalPages: Int?, totalResults: Int?){
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
        
    }
}

class ShowModelUpComing: Decodable {
    var page: Int?
    var results: [Show?]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
    
    }
    
    init(page: Int?, results: [Show?]?){
        self.page = page
        self.results = results
    }
}

class Dates: Decodable {
    var minimum: String?
    var maximum: String?
    
    enum CodingKeys: String, CodingKey {
        case minimum = "minimum"
        case maximum = "maximum"
    }
    
    init(minimum: String?, maximum: String?) {
        self.maximum = maximum
        self.minimum = minimum
    }
}

class Show: Decodable {
    var id: Int?
    var title: String?
    var poster_path: String?
    var vote_average: Float?
    var release_date: String?
    var overview: String?
    var backdrop_path: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case poster_path = "poster_path"
        case vote_average = "vote_average"
        case release_date = "release_date"
        case overview = "overview"
        case backdrop_path = "backdrop_path"
    }
    
    init(id: Int?, title: String?, poster_path: String?, vote_average: Float?, release_date: String?, overview: String?, backdrop_path: String?){
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.release_date = release_date
        self.overview = overview
        self.backdrop_path = backdrop_path
    }
}


