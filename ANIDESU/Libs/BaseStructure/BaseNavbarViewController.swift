//
//  BaseNavbarViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class BaseNavbarViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar()
        self.setUpProfileImage()
    }
    
    private func setUpNavBar() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AnidesuColor.White.color()]
        self.navigationItem.backBarButtonItem?.tintColor = AnidesuColor.White.color()
    }
    
    func setUpProfileImage() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        image.setCircularImage(image: UIImage(named: "ic_user_default")!, borderWidth: 1,  borderColor: .White)
        containView.addSubview(image)
        containView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.profileImageAction(sender:))))
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationBar.topItem?.rightBarButtonItem = rightBarButton
    }
    
    @objc func profileImageAction(sender: UITapGestureRecognizer) {
        var storyboardName = "Login"
        if UserData.sharedInstance.isLogin {
            storyboardName = "MyProfile"
        }
        let storyboard = UIStoryboard(name: storyboardName, bundle: .main)
        let vc = storyboard.instantiateInitialViewController()!
        self.present(vc, animated: true)
    }

}
