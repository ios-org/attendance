//
//  LoginContract.swift
//  weInternet
//
//  Created by Mohamed Shaikhon on 11/17/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import Foundation
protocol LoginContract {
    //    associatedtype ConformingType
    
    func login (username: String!, password: String!, completion: @escaping (AnyObject?, Error?)-> Void)
    func handleTokenExpiry(completion: @escaping ()->())
    func notifyGoToLoginScreen()
}

extension LoginContract {
    //shouldn't auto login when at login screen
    func login(username: String!, password: String!, completion: @escaping (AnyObject?, Error?)-> Void){
        var params: [String : Any]? = nil
        guard let username = username, let password = password else {

            notifyGoToLoginScreen()


            completion(nil,nil)

            return
        }
        notifyGoToLoginScreen()

//        params = ["username": username, "password": password]
//
//        MainReqeustClass.BaseRequestSharedInstance.POSTRequset(showLoader: true, url: loginURL,headers:[:], parameter: params! as [String : AnyObject], success: { (res,statusCode) in
//
//            if(statusCode == 500){
//                completion(nil, nil)
//            }else{
//                do {
//                    let decoder = JSONDecoder()
//                    let loginRes = try decoder.decode(LoginRes.self, from: res! as! Data)
//
//                    if let token = loginRes.token{
//                        KeychainService.savePassword(service: Constants.service1, account: Constants.account, data: token)
//                        //
//                        completion(token as AnyObject, nil)
//                    }else{
//                        completion(nil, nil)
//
//                        return
//                    }
//
//                }catch {
//                    completion(nil, error)
//
//                }
//            }
//
//        }) { (error) in
////            print(error!) //here i need to handle the message returned
//            completion(nil, error as? Error)
//        }
    }
    func handleTokenExpiry(completion: @escaping ()->()) {
        //for debugging
//        self.login(username: "Ara1HKvoWGZa8G++o6WwcQUqG4hvhw/Q48tbR7I8DVc=", password: "2F1y51YKIfqoFepMWMMlFg=="){  (token,err) in
            
            //for production
        notifyGoToLoginScreen()
    }
    func notifyGoToLoginScreen() {
        Constants.notificationCenter.post(name: Constants.loginNotificationName, object: nil)
    }
    
}



