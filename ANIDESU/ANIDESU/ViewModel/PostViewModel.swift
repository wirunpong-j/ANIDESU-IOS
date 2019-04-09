//
//  PostViewModel.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 9/4/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import RxCocoa
import RxSwift

class PostViewModel {
    var firebaseManager = FirebaseManager()
    
    let isLoading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    let fetchPostCompleted = PublishSubject<Bool>()
    var post: PostResponse?
    
//    func createPost(message: String, completion: @escaping () -> ()) {
//        self.isLoading.onNext(true)
//
//        self.firebaseManager.createPost(message: message, onSuccess: {
//            completion()
//            self.isLoading.onNext(false)
//        }) { (error) in
//            self.errorRelay.accept(error.localizedDescription)
//            self.isLoading.onNext(false)
//        }
//    }
    
//    func fetchAllPost(completion: @escaping ([PostResponse]) -> ()) {
//        self.isLoading.onNext(true)
//
//        self.firebaseManager.fetchAllPost(onSuccess: { (allPost) in
//            completion(allPost)
//            self.isLoading.onNext(false)
//        }) { (error) in
//            self.errorRelay.accept(error.localizedDescription)
//            self.isLoading.onNext(false)
//        }
//    }
    
//    func addComment(postKey: String, message: String, completion: @escaping () -> ()) {
//        self.firebaseManager.addComment(postKey: postKey, message: message, onSuccess: {
//            completion()
//        }) { (error) in
//            self.errorRelay.accept(error.localizedDescription)
//        }
//    }
    
    func fetchPost(id: String) {
        self.isLoading.onNext(true)
        
        firebaseManager.fetchPost(id: id, completion: { (post) in
            self.fetchAllComment(postID: id, completion: { (comments) in
                post.comments = comments
                self.post = post
                self.fetchPostCompleted.onNext(true)
                self.isLoading.onNext(false)
            })
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
    
    func fetchAllComment(postID: String, completion: @escaping ([CommentResponse]) -> ()) {
        self.isLoading.onNext(true)
        
        firebaseManager.fetchAllComment(postID: postID, completion: { (response) in
            completion(response)
            self.isLoading.onNext(false)
        }) { (errorObj) in
            self.isLoading.onNext(false)
            self.error.onNext(errorObj.errorMessage)
        }
    }
}
