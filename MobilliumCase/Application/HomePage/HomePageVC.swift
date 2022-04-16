//
//  HomePageVC.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//
import Foundation
import UIKit
import RxSwift

class HomePageVC: UIViewController {
    let viewModel = HomePageVM()
  
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            viewModel.showModelNowPlaying.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] data in
                self?.pageControl.numberOfPages = data?.count ?? 0
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
    @IBOutlet weak var collectionViewContent: ContentSizedCollectionView! {
        didSet {
            collectionViewContent.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
            viewModel.showModelNowPlaying.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] status in
                self?.collectionViewContent.reloadData()
            }).disposed(by: viewModel.disposeBag)
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        viewModel.showModel.accept(viewModel.showModel.value)
        viewModel.showModelNowPlaying.accept(viewModel.showModelNowPlaying.value)
        
    }
    
    @IBOutlet weak var tableViewContent: ContentSizedTableView! {
        didSet {
            tableViewContent.register(UINib(nibName: "ShowCell", bundle: nil), forCellReuseIdentifier: "ShowCell")
            viewModel.showModel.observe(on: MainScheduler.asyncInstance).subscribe(onNext: { [weak self] status in
                self?.tableViewContent.reloadData()
            }).disposed(by: viewModel.disposeBag)
        }
    }
    
}

extension HomePageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.showModel.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resultCell: ShowCell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as? ShowCell , let show =  self.viewModel.showModel.value?[indexPath.row] else {
            return UITableViewCell()
        }
        
        resultCell.configure(show: show)
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 10 == self.viewModel.showModel.value?.count {
            viewModel.getData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let show = viewModel.showModel.value?[indexPath.row] , let id = show.id else { return }
        let detailPage = ShowDetailsVC()
        detailPage.viewModel.getShowDetail(id: String(id))
        self.navigationController?.pushViewController(detailPage, animated: true)
    }
    
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.showModelNowPlaying.value?.count ?? 0
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let resultCell: MovieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell, let show = viewModel.showModelNowPlaying.value?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        resultCell.configure(show: show)
        return resultCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let show = viewModel.showModelNowPlaying.value?[indexPath.row] , let id = show.id else { return }
        let detailPage = ShowDetailsVC()
        detailPage.viewModel.getShowDetail(id: String(id))
        self.navigationController?.pushViewController(detailPage, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
}




