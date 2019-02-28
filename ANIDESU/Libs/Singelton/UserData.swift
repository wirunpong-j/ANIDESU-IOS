//
//  UserData.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 26/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation

class UserData {
    static var sharedInstance = UserData()
    
    var info: UserResponse?
    
    var isLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLogin")
        } set {
            UserDefaults.standard.set(newValue, forKey: "isLogin")
        }
    }
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "token")
        } set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
    
    var uid: String? {
        get {
            return UserDefaults.standard.string(forKey: "uid")
        } set {
            UserDefaults.standard.set(newValue, forKey: "uid")
        }
    }
    
    func logout() {
        self.isLogin = false
        self.info = nil
        self.token = nil
        self.uid = nil
    }
}
