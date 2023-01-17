//
//  LoginInteractor.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 3/27/19.
//  Copyright Â© 2019 ahmedfouad. All rights reserved.
//

import Foundation
import Alamofire
import FirebaseMessaging
import FirebaseInstanceID

/**
 belkj
 */
class LoginInteractor{
    static let sharedInstance = LoginInteractor()
    var fcmToken = ""
    //    var loginResponse: LoginResponse? = nil
    //    var apiErrorResponse: APIError? = nil
    
    func loginService(username: String!, password: String!, completion: @escaping (AnyObject?, String?)-> Void){
        var params: [String : Any]? = nil
        print(loginURL)
        guard let username = username, let password = password else {
            return
        }
        
        params = ["username": username, "password": password]
        
        MainReqeustClass.BaseRequestSharedInstance.POSTRequset(showLoader: true, url: loginURL, parameter: params! as [String : AnyObject], success: { (res,_)  in
            completion(res, nil)
        }) { (error) in
            //            print(error!) //here i need to handle the message returned
            completion(nil, error)
        }
    }
    
    func subscribeFCMTikenService(completion: @escaping (AnyObject?, String?)-> Void){
        
        fcmToken = Messaging.messaging().fcmToken?.description ?? ""
        let params = ["deviceType": 2, "token": fcmToken] as [String : Any]
        MainReqeustClass.BaseRequestSharedInstance.POSTRequset(showLoader: true, url: subscribeFCMTokenURL, parameter: params as [String : AnyObject], success: { (res,_)  in
            completion(res, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}

