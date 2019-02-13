//
//  BaseViewController.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 13/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoading() {
        if !self.isLoading {
            let loadingNotification = MBProgressHUD.showAdded(to: self.navigationController?.view ?? self.view, animated: true)
            loadingNotification.mode = MBProgressHUDMode.indeterminate
            loadingNotification.label.text = "Loading"
            self.isLoading = true
        }
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: self.navigationController?.view ?? self.view, animated: true)
        self.isLoading = false
    }
    
    func showAlert(title: String, message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let completion = completion {
                completion()
            }
        })))
        self.present(alert, animated: true)
    }
    
    func showAlertAction(title: String, message: String, rightButtonTitle: String, cancelButtonTitle: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: rightButtonTitle, style: .default, handler: { (_) in
            if let completion = completion {
                completion()
            }
        }))
        alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
//    func showLoginPageViewController(delegate: LoginViewControllerDelegate) {
//        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
//        if let vc = storyboard.instantiateInitialViewController() as? LoginViewController {
//            vc.delegate = delegate
//            self.present(vc, animated: true)
//        }
//    }
}
