//
//  LaunchVC.swift
//  weInternet
//
//  Created by Mohamed Shaikhon on 2/18/20.
//  Copyright © 2020 ahmedfouad. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
  //  private var versionCheckerPresenter: VersionCheckPresenter?
    private var navigateToVC: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
    //    versionCheckerPresenter = VersionCheckPresenter(versionCheckView: self)
    }
    func getSupportedVersion() {
    //    versionCheckerPresenter?.getMinimumSupportVersion()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getSupportedVersion()
        navigateTo()
    }
    func setNavigatationTo(vc: UIViewController){
        navigateToVC = vc
    }
    func navigateTo(){
        if navigateToVC != nil {
            guard let window = UIApplication.shared.keyWindow else {return}
            let options: UIView.AnimationOptions = .transitionCurlUp
            
            // The duration of the transition animation, measured in seconds.
            let duration: TimeInterval = 0.8
            
            // Creates a transition animation.
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
//            navigateToVC?.modalPresentationStyle = .fullScreen
            let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
            if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "Login2VC") as? Login2VC {
                window.rootViewController = dashNC
            }
//            present(navigateToVC!, animated: true, completion: nil)
        }
    }
    
}
//extension LaunchVC: VersionCheckView {
//    func getAppVersionSupportStatus(shouldUpdate: Bool) {
//        if shouldUpdate {
//            showForceUpdateAlert()
//        }else {
//            navigateTo()
//
//        }
//    }
//
//    func getReachability(isConnected: Bool) {
//        navigateTo()
//
//    }
//
//    func getAppVersionSupportFailure() {
//        navigateTo()
//
//    }
//    func showForceUpdateAlert() {
//        let alert = UIAlertController(title: "تحديث متوفر",message: "يوجد إصدار جديد من التطبيق متاح الأن، يرجي التحديث لضمان الاستخدام الأمثل لخدمات التطبيق", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "تحديث", style: UIAlertAction.Style.default, handler: { _ in
//            self.versionCheckerPresenter?.goToAppStore()
//        }))
//        present(alert, animated: true, completion: nil)
//    }
//
//}
