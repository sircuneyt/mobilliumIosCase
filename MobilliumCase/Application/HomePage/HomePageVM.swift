//
//  HomePageVM.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//

import Foundation
import RxCocoa
import RxSwift


class HomePageVM {
    let disposeBag = DisposeBag()
    let showModel = BehaviorRelay<[Show?]?>(value: nil)
    let showModelNowPlaying = BehaviorRelay<[Show?]?>(value: nil)
    let pageNumber = BehaviorRelay<Int>(value: 1)
    let lazyLoad = BehaviorRelay<Bool>(value: false)
    let showDifferent = BehaviorRelay<Bool>(value: false)
 
    
   
    init() {
        getData()
        getDataNowplaying()
    }
    
    func getData() {
        if lazyLoad.value == false {
            lazyLoad.accept(true)
            GetUpComing(page: pageNumber.value).execute { [weak self] data in
                if self?.pageNumber.value != 1 {
                    var newList = self?.showModel.value
                    newList?.append(contentsOf: data?.results ?? [])
                    self?.showModel.accept(newList)
                } else {
                    self?.showModel.accept(data?.results)
                }
                self?.pageNumber.accept((self?.pageNumber.value ?? 0) + 1)
                self?.lazyLoad.accept(false)
            }
        }
    }
    
    
    func getDataNowplaying() {
            GetNowPlaying(page: pageNumber.value).execute { [weak self] data in
                    self?.showModelNowPlaying.accept(data?.results)
                print(data?.results?.count)
            }
    }
}
