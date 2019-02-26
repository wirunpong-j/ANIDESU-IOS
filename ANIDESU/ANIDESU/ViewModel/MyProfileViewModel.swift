//
//  MyProfileViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import RxCocoa
import RxSwift

class MyProfileViewModel {
    let firebaseManager = FirebaseManager()
    let userManager = UserManager()
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let logoutIsCompleted = PublishSubject<Bool>()
    let getUserDataCompleted = PublishSubject<Bool>()
    
    func getUserData() {
        self.isLoading.onNext(true)
        firebaseManager.getUserInfo(uid: UserData.sharedInstance.uid!, completion: { (response) in
            UserData.sharedInstance.info = response
            self.isLoading.onNext(false)
            self.getUserDataCompleted.onNext(true)
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
    
    func logout() {
        self.isLoading.onNext(true)
        userManager.signOut(completion: {
            UserData.sharedInstance.logout()
            self.isLoading.onNext(false)
            self.logoutIsCompleted.onNext(true)
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
}
