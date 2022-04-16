//
//  GetMovieDetails.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 13.04.2022.
//

import Foundation
import Alamofire

class GetMovieDetails {
    var showId: String
    var path: String = "movie/"
    
    init(showId: String) {
        self.showId = showId
    }
    
    func execute(completion: @escaping (Show?) -> ()) {
        let buildUrl = "\(NetworkConstant.BASE_URL)\(path)\(showId)?\(NetworkConstant.API_KEY)&\(NetworkConstant.LANGUAGE)"
        let request = AF.request(buildUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        request.responseDecodable(of: Show.self) { (response) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {            })
            print(String(decoding: response.data ?? Data(), as: UTF8.self))
            guard let response = response.value else {
                return
            }
           
            completion(response)
        }
    }
}
