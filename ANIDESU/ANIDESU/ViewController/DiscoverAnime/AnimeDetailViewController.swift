//
//  AnimeDetailViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 20/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class AnimeDetailViewController: BaseViewController {
    static let identifier = "AnimeDetailViewController"

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var bgView: UIView!
    
    var anime: AnimeResponse?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private enum Rows: Int {
        case header
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavbar()
        self.setUpView()
    }
    
    func setUpNavbar() {
        navbar.setBackgroundImage(UIImage(), for: .default)
        navbar.shadowImage = UIImage()
        navbar.isTranslucent = true
        navbar.backgroundColor = .clear
        self.setUpBackButtonView()
    }
    
    func setUpBackButtonView() {
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
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.register(AnimeHeaderCell.nibFile, forCellReuseIdentifier: AnimeHeaderCell.identifier)
        
        if let imageUrl = anime?.bannerImage {
            bannerImageView.setImage(urlStr: imageUrl)
        } else {
            bannerImageView.setImage(urlStr: (anime?.coverImage?.sizeXLarge)!)
        }
        bgView.backgroundColor = UIColor().hexStringToUIColor(hex: (anime?.coverImage?.color)!)
    }

    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension AnimeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Rows(rawValue: indexPath.row)! {
        case .header:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AnimeHeaderCell.identifier) as? AnimeHeaderCell {
                if let anime = self.anime {
                    cell.setUpCell(anime: anime)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}
