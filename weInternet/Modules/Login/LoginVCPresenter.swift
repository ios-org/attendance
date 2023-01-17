//
//  LoginVCPresenter.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 3/31/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import Foundation
import FirebaseMessaging

protocol LoginView: class {
    func validationFailed()
    func loggedInSuccessfully(userId: Int, userType: String, token: String)
}

protocol SubscribeFCMTokenView: class {
    func sucessSubscribe(message: String)
    func failureSubscribe(message: String)
}

enum User: String{
    case usernameEncrypted
    case passwordEncrypted
}

class LoginVCPresenter {
    
    
    
    private weak var delegate: LoginView?
    private weak var subscribeFCMTokenView: SubscribeFCMTokenView?
    
    private let interactor = LoginInteractor()
    var loginRes: LoginRes?
    var userCredDict: [User: String] = [:]
    
    init(view1: LoginView, view2: SubscribeFCMTokenView) {
        self.delegate = view1
        self.subscribeFCMTokenView = view2
    }
    
    func userLogin(username: String, password: String) {
        
        if(loginValidation(username, password: password, PasswordMinimumLenght: 5, PasswordMaximumLenght: 30)){
            
            
            userCredDict = encrypt(username: username, password: password)
            interactor.loginService(username: userCredDict[.usernameEncrypted], password: userCredDict[.passwordEncrypted]) {[weak self] (res, error) in
                guard let self = self else{
                    return
                }
                
                
                if let error = error {
                    //                    print(error)
                    ShowToast.ShowToast(error)
                }else{
                    //here res recived as APIException object
                    if let res: APIException = res as? APIException{
                        //                        print(res.exception.messageEn)
                        ShowToast.ShowToast(res.arabicMessage)
                        
                        print(res.arabicMessage)
                        ShowToast.ShowToast(res.arabicMessage)
                    }else{
                        do {
                            
                            let decoder = JSONDecoder()
                            guard let res = res else {
                                ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                                return
                            }
                            self.loginRes = try decoder.decode(LoginRes.self, from: res as! Data)
                            //                            print(loginRes.token!)
                            if(self.loginRes?.token == nil){
                                ShowToast.ShowToast("Invalid username or password")
                            }else{
                                Constants.loginToken = self.loginRes?.token ?? ""
                                let cairo  = "cairo"
                                var replaced = username.lowercased().replacingOccurrences(of: cairo, with: "")
                                if !replaced.contains(where: {$0 == "@"}){replaced = replaced + "@te.eg"}
                                AppUserDefaults.setUserDefaultValue(value:String(replaced.dropFirst()), key: Constants.userEmail)
                                self.delegate?.loggedInSuccessfully(userId: self.loginRes?.userId ?? 0, userType: self.loginRes?.userType ?? "", token: self.loginRes?.token ?? "")
                            }
                            
                        } catch let error {
                            //                            print(error.localizedDescription)
                            ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                        }
                    }
                }
            }
        }else{
            self.delegate?.validationFailed()
        }
    }
    
    func encrypt(username: String, password: String) -> [User: String]{
        let encryptRSA = EncryptRSA()
        
        var userCredDict = [User: String]()
        //        if let aes = try? AES(key: Constants.key, iv: Constants.iv), let userEncrypted = try? aes.encrypt(Array(username.utf8)), let passEncrypted = try? aes.encrypt(Array(password.utf8)) {
        //
        
        let cipherUser = encryptRSA.encrypt(string: username)
        let cipherPass = encryptRSA.encrypt(string: password)
        
        
        userCredDict[.usernameEncrypted] = cipherUser
        userCredDict[.passwordEncrypted] = cipherPass
        
        //            let aesD = try? aes.decrypt(userEncrypted)
        //            let decrypted = String(bytes: aesD!, encoding: .utf8)
        //            print("AES decrypted: \(decrypted)")
        
        return userCredDict
    }
    
    
    
    
    func subscribeFCMToken() {
        
        interactor.subscribeFCMTikenService() {(res, error) in
            if error != nil {
                self.subscribeFCMTokenView?.failureSubscribe(message: error ?? "")
            }else{
                //here res recived as APIException object
                if let res: APIException = res as? APIException{
                    //                        print(res.exception.messageEn)
                    ShowToast.ShowToast(res.arabicMessage)
                    
                    print(res.arabicMessage)
                    ShowToast.ShowToast(res.arabicMessage)
                }else{
                    
                    
                    
                    do {
                        
                        let decoder = JSONDecoder()
                        let res = try decoder.decode(SubscribeFCMTokenModel.self, from: res! as! Data)
                        
                        Constants.loginToken = nil
                        
                        self.subscribeFCMTokenView?.sucessSubscribe(message: res.arabicMessage ?? "")
                        
                    } catch let error {
                        //                            print(error.localizedDescription)
                        ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                    }
                    if let token = self.loginRes?.token{
                        
                        AppUserDefaults.setUserDefaultValue(value: self.loginRes?.name ?? "", key: Constants.userName)
                        

                        KeychainService.savePassword(service: Constants.service1, account: Constants.account, data: token)
                        
                        KeychainService.savePassword(service: Constants.service2, account: Constants.account, data: self.userCredDict[.usernameEncrypted]!)
                        
                        KeychainService.savePassword(service: Constants.service3, account: Constants.account, data: self.userCredDict[.passwordEncrypted]!)
                        
                    }
                }
            }
            
        }
        
    }
    
}
