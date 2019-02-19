//
//  BaseTabManViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class BaseTabManViewController: TabmanViewController {
    private let bar = TMBar.ButtonBar()
    
    let ALL_SEASON = [AnimeSeason.Winter, AnimeSeason.Spring, AnimeSeason.Fall, AnimeSeason.Summer]
    let ALL_STATUS = [MyAnimeListType.PlanToWatch, MyAnimeListType.Watching, MyAnimeListType.Completed, MyAnimeListType.Dropped]
    let discoverAnimeMenuIdentifier = "DiscoverAnimeMenuViewController"
    let myAnimeListMenuIdentifier = "MyAnimeListMenuViewController"
    
    var menus = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }
    
    func setUpView() {
        self.dataSource = self
        
        self.bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 16, bottom: 0.0, right: 16)
        self.bar.layout.interButtonSpacing = 24.0
        self.bar.layout.contentMode = .intrinsic
        
        self.bar.indicator.weight = .medium
        self.bar.indicator.cornerStyle = .eliptical
        self.bar.indicator.tintColor = AnidesuColor.Green.color()
        self.bar.indicator.overscrollBehavior = .compress
        
        self.bar.fadesContentEdges = true
        
        self.bar.backgroundColor = AnidesuColor.DarkBlue.color()
        self.bar.backgroundView.style = .clear
        self.bar.buttons.customize { (button) in
            button.selectedTintColor = AnidesuColor.Green.color()
            button.tintColor = AnidesuColor.White.color()
            button.font = UIFont(name: "HelveticaNeue-Bold", size: 16)!
        }
        
        self.setViewController()
        self.addBar(bar, dataSource: self, at: .top)
        self.navigationController?.navigationBar.barTintColor = AnidesuColor.MiddleDarkBlue.color()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AnidesuColor.White.color()]
        self.tabBarController?.tabBar.backgroundColor = AnidesuColor.MiddleDarkBlue.color()
        self.reloadData()
    }
    
    private func setViewController() {
        switch self.restorationIdentifier {
        case discoverAnimeMenuIdentifier:
            for season in ALL_SEASON {
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: DiscoverAnimeViewController.identifier) as? DiscoverAnimeViewController
//                viewController?.animeSeason = season
                self.menus.append(viewController!)
            }
        case myAnimeListMenuIdentifier:
            for myAnimeListStatus in ALL_STATUS {
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: MyAnimeListViewController.identifier) as? MyAnimeListViewController
//                viewController?.myAnimeListStatus = myAnimeListStatus
                self.menus.append(viewController!)
            }
        default:
            break
        }
    }
}
extension BaseTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return self.menus.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.menus[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if let title = self.getMenuTitle(at: index) {
            return TMBarItem(title: title)
        }
        return TMBarItem(title: "N/A")
    }
    
    private func getMenuTitle(at index: Int) -> String? {
        switch self.restorationIdentifier {
        case discoverAnimeMenuIdentifier:
            return ALL_SEASON[index].rawValue.uppercased()
        case myAnimeListMenuIdentifier:
            return ALL_STATUS[index].rawValue.uppercased()
        default:
            return nil
        }
    }

}
