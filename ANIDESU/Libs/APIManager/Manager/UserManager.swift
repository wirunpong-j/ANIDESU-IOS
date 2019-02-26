//
//  UserManager.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Firebase
import FirebaseAuth
import FBSDKLoginKit
import FBSDKCoreKit

class UserManager {
    func signIn(email: String, password: String, completion: @escaping (String) -> (), onFailure: @escaping (BaseError) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                onFailure(BaseError(message: error.localizedDescription))
            } else {
                result?.user.getIDToken(completion: { (token, error) in
                    print("|-------------------------------------------------")
                    print("Firebase Token: \(token!)")
                    print("--------------------------------------------------|")
                    completion(token!)
                })
            }
        }
    }
    
    func signOut(completion: @escaping () -> (), onFailure: @escaping (BaseError) -> ()) {
        do {
            try Auth.auth().signOut()
            completion()
        } catch {
            onFailure(BaseError(message: error.localizedDescription))
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (String) -> (), onFailure: @escaping (BaseError) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                onFailure(BaseError(message: error.localizedDescription))
            } else {
                result?.user.getIDToken(completion: { (token, error) in
                    print("|-------------------------------------------------")
                    print("Firebase Token: \(token!)")
                    print("--------------------------------------------------|")
                    completion(token!)
                })
            }
        }
    }
    
    func signInWithFacebook(completion: @escaping (String, String) -> (), onFailure: @escaping (BaseError) -> ()) {
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (result, error) in
            if let error = error {
                onFailure(BaseError(message: error.localizedDescription))
            } else {
                result?.user.getIDToken(completion: { (token, error) in
                    print("|-------------------------------------------------")
                    print("Facebook Firebase Token: \(token!)")
                    print("--------------------------------------------------|")
                    completion((result?.user.uid)!, token!)
                })
            }
        }
    }
}
