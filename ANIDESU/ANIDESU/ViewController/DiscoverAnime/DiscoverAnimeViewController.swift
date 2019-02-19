//
//  DiscoverAnimeViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DiscoverAnimeViewController: BaseViewController {
    static let identifier = "DiscoverAnimeViewController"
    
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
        
    }
    
    private func setUpViewModel() {
        viewModel.isLoading.subscribe(onNext: { (isLoading) in
            
        }).disposed(by: disposedBag)
        
        viewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.isCompleted.subscribe(onNext: { (isCompleted) in
            self.showAlert(title: "Completed", message: "\(isCompleted)", completion: nil)
        }).disposed(by: disposedBag)
    }
    
    private func setUpView() {
        viewModel.getAnimeListBySeason(season: .Winter)
    }

}
