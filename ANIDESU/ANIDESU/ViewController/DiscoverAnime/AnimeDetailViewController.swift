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
    
    var anime: AnimeResponse?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(named: "ic_back"), for: .normal)
        button.tintColor = AnidesuColor.White.color()
        button.layer.shadowColor = AnidesuColor.Black.color().cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 0.25
        button.layer.masksToBounds = false
        backButton.customView = button
    }
    
    func setUpView() {
        if let imageUrl = anime?.bannerImage {
            bannerImageView.setImage(urlStr: imageUrl)
        } else {
            bannerImageView.setImage(urlStr: (anime?.coverImage?.sizeXLarge)!)
        }
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
