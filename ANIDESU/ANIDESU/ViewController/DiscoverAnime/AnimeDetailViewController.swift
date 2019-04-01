//
//  AnimeDetailViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import IGListKit

class AnimeDetailViewController: BaseViewController {
    static let identifier = "AnimeDetailViewController"

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gradientView: AnidesuGradientView!
    
    var viewModel = AnimeDetailViewModel()
    let disposedBag = DisposeBag()
    var animeID: Int?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private enum Sections: Int {
        case header, genres, menu, detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        self.setUpViewModel()
        self.setUpNavbar()
    }
    
    private func setUpTableView() {
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.register(AnimeHeaderCell.nibFile, forCellReuseIdentifier: AnimeHeaderCell.identifier)
        self.detailTableView.register(AnimeDetailCollectionViewCell.nibFile, forCellReuseIdentifier: AnimeDetailCollectionViewCell.identifier)
        self.detailTableView.register(AnimeSummaryDetailCell.nibFile, forCellReuseIdentifier: AnimeSummaryDetailCell.identifier)
    }
    
    private func setUpViewModel() {
        viewModel.error.subscribe(onNext: { (errorMessage) in
            self.showAlert(title: "Error", message: errorMessage, completion: nil)
        }).disposed(by: disposedBag)
        
        viewModel.isLoading.subscribe(onNext: { (isLoading) in
            if isLoading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }).disposed(by: disposedBag)
        
        viewModel.isCompleted.subscribe(onNext: { (isCompleted) in
            self.setUpView()
        }).disposed(by: disposedBag)
        
        viewModel.getAnimeByID(id: animeID!)
    }
    
    private func setUpNavbar() {
        navbar.setBackgroundImage(UIImage(), for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.backgroundColor = .clear
        self.setUpBackButtonView()
    }
    
    private func setUpBackButtonView() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        button.tintColor = AnidesuColor.White.color()
        button.layer.shadowColor = AnidesuColor.Black.color().cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        backButton.customView = button
    }
    
    func setUpView() {
        if let imageUrl = viewModel.anime?.bannerImage {
            bannerImageView.setImage(urlStr: imageUrl)
        } else {
            bannerImageView.setImage(urlStr: (viewModel.anime?.coverImage?.sizeXLarge)!)
        }
        
        var animeColor = AnidesuColor.Black.color()
        if let _color = viewModel.anime?.coverImage?.color {
            animeColor = UIColor().hexStringToUIColor(hex: (_color))
        }
        bgView.backgroundColor = animeColor
        gradientView.setUpColor(startColor: AnidesuColor.Clear.color(), endColor: animeColor)
        detailTableView.reloadData()
    }

    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AnimeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .detail:
            return 9
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .header:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AnimeHeaderCell.identifier) as? AnimeHeaderCell {
                if let anime = self.viewModel.anime {
                    cell.setUpCell(anime: anime)
                }
                return cell
            }
            
        case .genres:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AnimeDetailCollectionViewCell.identifier) as? AnimeDetailCollectionViewCell {
                let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
                if let anime = self.viewModel.anime {
                    cell.setUpCell(adapter: adapter, anime: anime, isAnimeDetailMenu: false)
                }
                return cell
            }
        case .menu:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AnimeDetailCollectionViewCell.identifier) as? AnimeDetailCollectionViewCell {
                let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
                if let anime = self.viewModel.anime {
                    cell.setUpCell(adapter: adapter, anime: anime, isAnimeDetailMenu: true)
                }
                return cell
            }
        case .detail:
            let summaryDetailRow = AnimeDetailViewModel.SummaryDetailRows(rawValue: indexPath.row)!
            var descTitle = ""
            
            switch summaryDetailRow {
            case .studios:
                descTitle = "Studios"
            case .ep:
                descTitle = (self.viewModel.anime?.episodes == nil) ? "TBD" : "\((self.viewModel.anime?.episodes)!)"
            case .status:
                descTitle = (self.viewModel.anime?.status == nil) ? "N/A" : (self.viewModel.anime?.status)!
            case .premiered:
                descTitle = "Premiered"
            case .ageRating:
                descTitle = "Age Rating"
            case .eng:
                descTitle = (self.viewModel.anime?.title?.englishTitle == nil) ? "N/A" : (self.viewModel.anime?.title?.englishTitle)!
            case .rmj:
                descTitle = (self.viewModel.anime?.title?.romanjiTitle == nil) ? "N/A" : (self.viewModel.anime?.title?.romanjiTitle)!
            case .jp:
                descTitle = (self.viewModel.anime?.title?.nativeTitle == nil) ? "N/A" : (self.viewModel.anime?.title?.nativeTitle)!
            case .synonyms:
                descTitle = "Synonyms"
            }
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: AnimeSummaryDetailCell.identifier) as? AnimeSummaryDetailCell {
                cell.setUpCell(subjectTitle: summaryDetailRow.getTitle(), descTtitle: descTitle)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .genres:
            return AnimeGenreCell.height + 16
        case .menu:
            return AnimeDetailMenuCell.height + 16
        case .detail:
            return 30
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch Sections(rawValue: section)! {
        case .detail:
            return AnimeDetailSectionHeaderView.loadViewFormNib(title: Localize.main(key: "Details"))
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch Sections(rawValue: section)! {
        case .detail:
            return 30
        default:
            return 0
        }
    }
}
