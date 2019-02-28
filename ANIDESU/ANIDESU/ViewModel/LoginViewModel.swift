//
//  LoginViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {
    let firebaseManager = FirebaseManager()
    let userManager = UserManager()
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let loginIsCompleted = PublishSubject<Bool>()
    
    func loginWithFacebook() {
        self.isLoading.onNext(true)
        userManager.signInWithFacebook(completion: {
            self.firebaseManager.getUserInfo(uid: UserData.sharedInstance.uid!, completion: { (response) in
                UserData.sharedInstance.info = response
                self.isLoading.onNext(false)
                self.loginIsCompleted.onNext(true)
            }, onFailure: { (errorObj) in
                self.isLoading.onNext(false)
                self.error.onNext(errorObj.errorMessage)
            })
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
    
    func loginWithUID() {
        self.isLoading.onNext(true)
        self.firebaseManager.getUserInfo(uid: UserData.sharedInstance.uid!, completion: { (response) in
            UserData.sharedInstance.info = response
            self.isLoading.onNext(false)
            self.loginIsCompleted.onNext(true)
        }, onFailure: { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        })
    }
}
