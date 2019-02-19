//
//  APIManager.swift
//  ANIDESU
//
//  Created by Wirunpong Jaingamlertwong on 19/2/2562 BE.
//  Copyright © 2562 Wirunpong Jaingamlertwong. All rights reserved.
//

import Foundation
import Alamofire

public class APIManager {
    public static let manager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        return Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
    
    static func request<Result: Decodable>(withRouter router: BaseRouter, responseType: Result.Type, completion: @escaping (_ result: Result) -> (), onFailure: @escaping (_ error: BaseError) -> ()) -> Request? {
        
        return manager.request(router)
            .logRequest()
            .responseData(completionHandler: { (response) in
                self.logResponse(response: response)
                
                switch response.result {
                case .success(let data):
                    do {
                        let responseObj = try JSONDecoder().decode(responseType, from: data)
                        if let statusCode = response.response?.statusCode, [200, 201].contains(statusCode) {
                            completion(responseObj)
                        } else {
                            if let object = responseObj as? BaseResponse {
                                switch object.statusCode {
                                case 400, 500:
                                    let error = BaseError(message: object.errorMessage ?? "")
                                    onFailure(error)
                                case 401, 404:
//                                    UserData.sharedInstance.isLogin = false
                                    let error = BaseError(message: object.errorMessage ?? "")
                                    onFailure(error)
                                default:
//                                    self.refreshToken(withOldRouter: router, responseType: responseType, completion: completion, onFailure: onFailure)
                                    let error = BaseError(message: "Can't connect server.")
                                    onFailure(error)
                                }
                            }
                        }
                    } catch {
                        let error = BaseError(message: "Can't connect server.")
                        onFailure(error)
                    }
                case .failure(let error):
                    let error = BaseError(message: error.localizedDescription)
                    onFailure(error)
                }
            })
    }
    
//    static func refreshToken<Result: Decodable>(withOldRouter router: Router, responseType: Result.Type, completion: @escaping (_ result: Result) -> (), onFailure: @escaping (BaseError) -> ()) {
//        UserManager().refreshToken(completion: { (response) in
//            self.request(withRouter: router, responseType: responseType, completion: completion, onFailure: onFailure)
//        }) { (error) in
//            onFailure(error)
//        }
//    }
}
