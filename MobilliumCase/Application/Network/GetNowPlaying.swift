//
//  GetShows.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 13.04.2022.
//

import Foundation
import Alamofire

class GetNowPlaying {
    var page: Int
    var path: String = "movie/now_playing?"
    
    init(page: Int) {
        self.page = page
    }
    
    func execute(completion: @escaping (ShowModelNowPlaying?) -> ()) {
        let buildUrl = "\(NetworkConstant.BASE_URL)\(path)\(NetworkConstant.API_KEY)&\(NetworkConstant.LANGUAGE)&page=\(page)"
        let request = AF.request(buildUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        request.responseDecodable(of: ShowModelNowPlaying.self) { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            })
            print(String(decoding: response.data ?? Data(), as: UTF8.self))
            guard let response = response.value else {
                return
            }
           
            completion(response)
        }
    }
}

