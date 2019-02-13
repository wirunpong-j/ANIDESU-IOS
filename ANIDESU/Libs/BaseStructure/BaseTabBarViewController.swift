//
//  BaseTabViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import ESTabBarController_swift

class BaseTabBarViewController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.handleUrlScheme()
    }
    
    private func setUpTabBar() {
        if let tabBar = self.tabBar as? ESTabBar {
            tabBar.isTranslucent = false
            tabBar.barTintColor = AnidesuColor.DarkBlue.color()
            tabBar.itemCustomPositioning = .centered
        }
        
        let homeVC = UIViewController()
        let discoverVC = UIViewController()
        let myAnimeListVC = UIViewController()
        let reviewVC = UIViewController()
        
//        let v1 = dashboardStoryboard.instantiateInitialViewController() as! UINavigationController
//        let v2 = favoriteStoryboard.instantiateInitialViewController() as! UINavigationController
//        let v3 = myAccountStoryboard.instantiateInitialViewController() as! MyProfileViewController
//        let v4 = settingStoryboard.instantiateInitialViewController() as! UINavigationController
//
        homeVC.tabBarItem = ESTabBarItem.init(TabBarContentView(), title: nil, image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home"))
        discoverVC.tabBarItem = ESTabBarItem.init(TabBarContentView(), title: nil, image: UIImage(named: "ic_discover"), selectedImage: UIImage(named: "ic_discover"))
        myAnimeListVC.tabBarItem = ESTabBarItem.init(TabBarContentView(), title: nil, image: UIImage(named: "ic_mylist"), selectedImage: UIImage(named: "ic_mylist"))
        reviewVC.tabBarItem = ESTabBarItem.init(TabBarContentView(), title: nil, image: UIImage(named: "ic_review"), selectedImage: UIImage(named: "ic_review"))

        self.viewControllers = [homeVC, discoverVC, myAnimeListVC, reviewVC]
        self.delegate = self
    }
    
    private func showLoginViewController() {
//        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
//        if let vc = storyboard.instantiateInitialViewController() as? LoginViewController {
//            vc.delegate = self
//            self.present(vc, animated: true)
//        }
    }
    
//    private func handleUrlScheme() {
//        if let host = URLSchemeManager.sharedInstance.host {
//            let url = "davent://" + host
//            if url == URLScheme.eventDetail, let moduleName = URLSchemeManager.sharedInstance.params?.first {
//                self.showEventDetailViewController(eventID: moduleName.value)
//                URLSchemeManager.sharedInstance.clearParams()
//            }
//        }
//    }
    
//    private func showEventDetailViewController(eventID: String) {
//        let storyboard = UIStoryboard(name: "Event", bundle: Bundle.main)
//        let navbar = storyboard.instantiateInitialViewController()! as! UINavigationController
//        if let viewController = navbar.viewControllers.first as? EventDetailViewController {
//            viewController.event = EventResponse(id: eventID)
//        }
//        self.present(navbar, animated: true, completion: nil)
//    }
}

//extension BaseTabBarViewController: LoginViewControllerDelegate {
//    func loginIsCompleted() {
//
//    }
//}

class TabBarContentView: ESTabBarItemContentView {
    public var duration = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.iconColor = AnidesuColor.White.color()
        self.highlightIconColor = AnidesuColor.White.color()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = .cubic
        self.imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

extension BaseTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if !UserData.sharedInstance.isLogin {
//            if let _ = viewController as? MyProfileViewController {
//                self.showLoginViewController()
//                return false
//            } else if let navbar = viewController as? UINavigationController {
//                if let _ = navbar.viewControllers.first as? FavoriteViewController {
//                    self.showLoginViewController()
//                    return false
//                }
//            }
//        }
        
        return true
    }
}
