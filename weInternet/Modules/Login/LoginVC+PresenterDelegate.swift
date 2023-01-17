//
//  LoginVC+PresenterDelegate.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 4/2/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import Foundation
import UIKit

extension Login2VC: LoginView{
    func loggedInSuccessfully(userId: Int, userType: String, token: String) {
        if(userType == "FAMILLIES" && userId == 3){
            KeychainService.savePassword(service: Constants.service1, account: Constants.account, data: token)
        //    navigateToFamiliesHome()
        }else{
            loginSuccess()
        }
    }
    
    func validationFailed() {
//        print("validation Failed !!!")
    }
    
//    func loggedInSuccessfully() {
////        print("data fetched Successfully !!!")
//
//
//        //self.performSegue(withIdentifier: "Test", sender: self)
//    }
    
//    func navigateToFamiliesHome() {
//
//        Constants.medNetworkNo = 2
//        //below is important, userid=3 for ma3ashat part and for ma3ashat medical apis we send 2
//        UserDefaults.standard.set("3", forKey: Constants.userId)
//        UserDefaults.standard.synchronize()
//
//        KeychainService.savePassword(service: Constants.userId, account: Constants.account, data: "3")
//
//        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home
//            , bundle:nil)
//        let medicalTEORGlobeVC: MedicalTEORGlobeVC? = storyBoard.instantiateViewController(withIdentifier: "MedicalTEORGlobeVC") as? MedicalTEORGlobeVC
//        let myNavigationController = UINavigationController(rootViewController: medicalTEORGlobeVC!)
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//
//        myNavigationController.navigationBar.isHidden = true
//        window.rootViewController = myNavigationController
//        window.makeKeyAndVisible()
//    }
    
    func loginSuccess() {
        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
        if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "HomeAttendanceVC") as? HomeAttendanceVC {
            self.present(dashNC, animated: true)
        }
//        presenter.subscribeFCMToken()
        
    }
}


extension Login2VC: SubscribeFCMTokenView {
    func sucessSubscribe(message: String) {
        print(message)
        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Main, bundle:nil)
        if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController {
            
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            window.rootViewController = dashNC
            window.makeKeyAndVisible()
        }

    }
    
    func failureSubscribe(message: String) {
        print(message)
        ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
    }
}
