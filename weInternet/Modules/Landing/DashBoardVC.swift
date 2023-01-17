//
//  DashBoardVC.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 8/25/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController {
    var isUpToDate: Bool?
  //  var versionCheckerPresenter: VersionCheckPresenter?

    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var viewContainer1: UIView!{
        didSet{
            viewContainer1.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var viewContainer2: UIView!{
        didSet{
            viewContainer2.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var viewContainer3: UIView!{
        didSet{
            viewContainer3.layer.cornerRadius = 30
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.post(name: Constants.resetCachNotificationName, object: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        versionCheckerPresenter = VersionCheckPresenter(versionCheckView: self)
//        versionCheckerPresenter?.getMinimumSupportVersion()

        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(viewContainer1Clicked))
        viewContainer1.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(viewContainer2Clicked))
        viewContainer2.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(viewContainer3Clicked))
        viewContainer3.addGestureRecognizer(tapGesture3)
        
        
//        if  AppUserDefaults.getUserDefaultValueForKey(key: "medNetworkNo") == "2"  {
//         self.viewContainer3.isHidden = true
//        }
//        else {
//            self.viewContainer3.isHidden = false
//
//        }
    }
    
    @objc func viewContainer1Clicked()  {
//        getReachability(isConnected: isInternetConnection())
//        if isUpToDate != nil {
        Constants.medNetworkNo = 1
//        if CachedDataSource.shared.medicalNumber != String(Constants.medNetworkNo) {
//            CachedDataSource.shared.removeAllCachedData()
//        }
        self.navigate(recognizer: viewContainer1)
//        }else {
//            versionCheckerPresenter?.getMinimumSupportVersion()
//
//        }
    }
    @objc func viewContainer2Clicked()  {
//        getReachability(isConnected: isInternetConnection())
//        if isUpToDate != nil {
        Constants.medNetworkNo = 3
        
//        if CachedDataSource.shared.medicalNumber != String(Constants.medNetworkNo) {
//            CachedDataSource.shared.removeAllCachedData()
//        }
        self.navigate(recognizer: viewContainer2)
//        }else {
//            versionCheckerPresenter?.getMinimumSupportVersion()
//
//        }
    }
    @objc func viewContainer3Clicked()  {
//        getReachability(isConnected: isInternetConnection())
//         if isUpToDate != nil {
        
        Constants.medNetworkNo = 2
        
//        if CachedDataSource.shared.medicalNumber != String(Constants.medNetworkNo) {
//            CachedDataSource.shared.removeAllCachedData()
//        }
        self.navigate(recognizer: viewContainer3)
//         }else {
//            versionCheckerPresenter?.getMinimumSupportVersion()
//
//        }
    }
    
    @IBAction func btnNotificationClicked(_ sender: Any) {
//        let myStoryBoard = UIStoryboard(name: "Doctor", bundle: nil)
//        let notificationVC = myStoryBoard.instantiateViewController(withIdentifier: "NotificationViewController" ) as! NotificationViewController
//        self.present(notificationVC, animated: true, completion: nil)
    }
    
    func navigate(recognizer: UIView)  {
        
        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home, bundle:nil)
        let homeVC  = storyBoard.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
        
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
}
//extension DashBoardVC: VersionCheckView {
//    func getAppVersionSupportFailure() {
//        ShowToast.ShowToast("حدث خطأ اثناء تحميل البيانات")
//
//    }
//
//    func getReachability(isConnected: Bool) {
//        if !isConnected {
//         let alert = UIAlertController(title: "من فضلك قم بالإتصال بالإنترنت", message: "", preferredStyle: .alert)
//                   alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
//                    if !isInternetConnection(){
//                        self.getReachability(isConnected: false)
//                    }
//
//                   }))
//                   present(alert, animated: true, completion: nil)
//        }else {
//
//            versionCheckerPresenter?.getMinimumSupportVersion()
//
//        }
//    }
//
//
//    func getAppVersionSupportStatus(shouldUpdate: Bool) {
//        if shouldUpdate {
//            let alert = UIAlertController(title: "برجاء تحديث التطبيق ", message: "", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
//                self.versionCheckerPresenter?.goToAppStore()
//            }))
//            present(alert, animated: true, completion: nil)
////           view.disableUserInteraction()
//
//        }else {
//            isUpToDate = true
////            view.enableUserInteraction()
//        }
//    }
//}
//extension UIView {
//
//    func disableUserInteraction() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMustUpdateToast))
//        addGestureRecognizer(tapGesture)
//        isUserInteractionEnabled = false
//    }
//    func enableUserInteraction() {
//        isUserInteractionEnabled = true
//    }
//    @objc func showMustUpdateToast() {
//        ShowToast.ShowToast("من فضلك قم بتحديث التطبيق أولا")
//
//    }
//}
