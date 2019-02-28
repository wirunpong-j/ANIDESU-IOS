//
//  BaseNavbarViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class BaseNavbarViewController: UINavigationController {
    static let NOTI_PROFILE_IMAGE_CHANGE = "NOTI_PROFILE_IMAGE_CHANGE"
    
    private var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addObservers()
        self.setUpNavBar()
        self.setUpProfileImage()
    }
    
    private func setUpNavBar() {
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: AnidesuColor.White.color()]
        self.navigationItem.backBarButtonItem?.tintColor = AnidesuColor.White.color()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.profileImageChanged),
            name: NSNotification.Name(rawValue: BaseNavbarViewController.NOTI_PROFILE_IMAGE_CHANGE), object: nil)
    }
    
    func setUpProfileImage() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        profileImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        self.profileImageChanged()
        containView.addSubview(profileImage)
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
    
    @objc func profileImageChanged() {
        if let imageUrl = UserData.sharedInstance.info?.profileImageUrl {
            profileImage.setCircularImage(urlStr: imageUrl, borderWidth: 1, borderColor: .White)
        } else {
            profileImage.setCircularImage(image: UIImage(named: "ic_user_default")!, borderWidth: 1,  borderColor: .White)
        }
    }
}
