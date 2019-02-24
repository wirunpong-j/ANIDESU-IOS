//
//  HomeViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 24/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class HomeViewModel {
    let firebaseManager = FirebaseManager()
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let fetchAllPostCompleted = PublishSubject<Bool>()
    
    var posts = [PostResponse]()
    
    func fetchAllPost() {
        self.isLoading.onNext(true)
        firebaseManager.fetchAllPost(completion: { (response) in
            self.posts = response
            self.isLoading.onNext(false)
            self.fetchAllPostCompleted.onNext(true)
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
}
