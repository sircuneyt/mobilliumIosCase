//
//  ShowDetailsVM.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//

import Foundation
import RxSwift
import RxCocoa

class ShowDetailsVM {
    let disposeBag = DisposeBag()
    let showModel = BehaviorRelay<Show?>(value: nil)
    
    
    func getShowDetail(id: String) {
        GetMovieDetails(showId: id).execute { [weak self] data in
            print(data?.id)
            self?.showModel.accept(data)

        }
        
    }
}
