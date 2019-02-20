//
//  DiscoverAnimeViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import IGListKit
import RxCocoa
import RxSwift

class DiscoverAnimeViewController: BaseViewController {
    static let identifier = "DiscoverAnimeViewController"
    
    @IBOutlet weak var animeListCollectionView: UICollectionView!
    
    var adapter: ListAdapter!
    var animeSeason: AnimeSeason!
    let viewModel = DiscoverAnimeViewModel()
    let disposedBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
        self.setUpViewModel()
        self.setUpView()
    }
    
    private func setUpCollectionView() {
        self.adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        self.adapter.collectionView = animeListCollectionView
        self.adapter.dataSource = self
    }
    
    private func setUpViewModel() {
        viewModel.isLoading.subscribe(onNext: { (isLoading) in
            
        }).disposed(by: disposedBag)
        
        viewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.isCompleted.subscribe(onNext: { (isCompleted) in
            self.adapter.reloadData(completion: nil)
        }).disposed(by: disposedBag)
    }
    
    private func setUpView() {
        viewModel.getAnimeListBySeason(season: animeSeason)
    }
}

extension DiscoverAnimeViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var animeList = [AnimeResponse]()
        for page in viewModel.animePage {
            animeList.append(contentsOf: page.anime!)
        }
        return [AnimePageDiffable(anime: animeList)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return AnimeListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
