//
//  ShowDetailsVC.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//


import Foundation
import UIKit
import RxSwift
import RxCocoa

class ShowDetailsVC: UIViewController {
    let viewModel = ShowDetailsVM()
    
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBOutlet weak var showPoster: UIImageView! {
        didSet {
            viewModel.showModel
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] shows in
                    if let posterUrl = shows?.backdrop_path {
                        self?.showPoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500"+posterUrl))
                    } else {
                        self?.showPoster.image = nil
                    }
                })
                .disposed(by: viewModel.disposeBag)
        }
    }
    @IBOutlet weak var showTitle: UILabel! {
        didSet {
            viewModel.showModel
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] shows in
                    if let title = shows?.title {
                        self?.title = title
                        self?.showTitle.text = title
                    }
                })
                .disposed(by: viewModel.disposeBag)
        }
    }
    
    @IBOutlet weak var showDate: UILabel! {
        didSet {
            viewModel.showModel
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] shows in
                    if let date = shows?.release_date {
                        self?.showDate.text = date                    }
                })
                .disposed(by: viewModel.disposeBag)
        }
    }
    @IBOutlet weak var showOverview: UILabel! {
        didSet {
            viewModel.showModel
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] shows in
                    if let overview = shows?.overview {
                        self?.showOverview.text = overview
                    }
                })
                .disposed(by: viewModel.disposeBag)
        }
    }
    @IBOutlet weak var showAvarage: UILabel! {
        didSet {
            viewModel.showModel
                .observe(on: MainScheduler.asyncInstance)
                .subscribe(onNext: { [weak self] shows in
                    if let showAvarage = shows?.vote_average {
                        self?.showAvarage.text = "\(String(showAvarage))/10 "
                    }
                })
                .disposed(by: viewModel.disposeBag)
        }
    }
}
