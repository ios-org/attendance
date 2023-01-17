//
//  AppUtility.swift
//  Service
//
//  Created by Ketan on 3/3/17.
//  Copyright © 2017 Junaid. All rights reserved.
//

import UIKit
import Reachability
import CoreLocation
import Keys
import Firebase

struct EncryptRSA {
    func encrypt(string: String) -> String? {
        let keys = WECareKeys()
        
        let keyString = keys.publicKey
        guard let data = Data(base64Encoded: keyString, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters) else {
            return nil
        }
        
        var attributes: CFDictionary {
            return [kSecAttrKeyType         : kSecAttrKeyTypeRSA,
                    kSecAttrKeyClass        : kSecAttrKeyClassPublic,
                    kSecAttrKeySizeInBits   : 1024,
                    kSecReturnPersistentRef : kCFBooleanTrue] as CFDictionary
        }
        
        var error: Unmanaged<CFError>? = nil
        guard let secKey = SecKeyCreateWithData(data as CFData, attributes, &error) else {
            print(error.debugDescription)
            return nil
        }
        
        let str = encrypt(string: string, publicKey: secKey)
        
        return str
    }
    
    func encrypt(string: String, publicKey: SecKey) -> String? {
        let buffer = [UInt8](string.utf8)
        
        var keySize   = SecKeyGetBlockSize(publicKey)
        var keyBuffer = [UInt8](repeating: 0, count: keySize)
        
        // Encrypto  should less than key length
        guard SecKeyEncrypt(publicKey, SecPadding.PKCS1, buffer, buffer.count, &keyBuffer, &keySize) == errSecSuccess else { return nil }
        return Data(bytes: keyBuffer, count: keySize).base64EncodedString()
    }
}
func setCornurRedius(_ idObject: UIView, radius: CGFloat) {
    idObject.layer.cornerRadius = radius;
    idObject.layer.masksToBounds = true
}


func offsetFrom(_ timeStemp:String) -> String {
    
    var oldDate = Date(timeIntervalSince1970: Double(timeStemp)!/1000)
    let cal = Calendar.current
    var components = (cal as NSCalendar).components([.era, .year, .month, .day], from:Date())
    let today = cal.date(from: components)!
    
    components = (cal as NSCalendar).components([.era, .year, .month, .day], from:oldDate);
    let otherDate = cal.date(from: components)!
    
    let dateFormatter = DateFormatter()
    
    if(today == otherDate) {
        dateFormatter.dateFormat = "hh:mm a"
    }
    else {
        dateFormatter.dateStyle = DateFormatter.Style.long
    }
    
    dateFormatter.locale = NSLocale.current
    let localDate = dateFormatter.string(from: oldDate)
    oldDate = dateFormatter.date(from: localDate)!
    
    
    return dateFormatter.string(from: oldDate)
}



//func setTextFieldWithBodre(txtField:UITextField, strPlaceHolde: String) {
//    
//    txtField.attributedPlaceholder = NSAttributedString(string: strPlaceHolde,
//                                                       attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
//    let myColor : UIColor = UIColor.init(colorLiteralRed: 207/255.0, green: 207/255.0, blue: 207/255.0, alpha: 1.0)
//    txtField.layer.borderColor = myColor.cgColor
//    txtField.layer.borderWidth = 1.0
//    
//}
//
//
//func setTextFieldWithoutBorder(txtField:UITextField, strPlaceHolde: String) {
//    
//    txtField.attributedPlaceholder = NSAttributedString(string: strPlaceHolde,
//                                                        attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
//}
//
//func setTextViewBorder(txtView:UITextView){
//    let myColor : UIColor = UIColor.init(colorLiteralRed: 207/255.0, green: 207/255.0, blue: 207/255.0, alpha: 1.0)
//    txtView.layer.borderColor = myColor.cgColor
//    txtView.layer.borderWidth = 1.0
//}
//
//func setCornerRedius(view:UIView, corner:Int){
//    
//    view.layer.cornerRadius = CGFloat(corner)
//    view.layer.masksToBounds = true
//}
//
//public func setHomeScreen() {
//    
//    let storyBoard : UIStoryboard = UIStoryboard (name:  Constants.StoryBoardFile.Main, bundle:nil)
//    let homeViewControlller  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.storyHomeViewControlller) as! HomeViewControlller
//    
//    let navigationController = UINavigationController(rootViewController: homeViewControlller)
//    navigationController.navigationBar.isHidden = true
//    
//    appDelegate.mainViewController.rootViewController = navigationController
//    appDelegate.mainViewController.setup(type: 1)
//    
//    let window = UIApplication.shared.delegate!.window!!
//    window.rootViewController = appDelegate.mainViewController
//    
//    UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//}
//
//func showProviderHomeScreen() {
//    
//    let storyBoard : UIStoryboard = UIStoryboard (name:  Constants.StoryBoardFile.Provider, bundle:nil)
//    let homeViewControlller  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.storyProviderHomeViewController) as! ProviderHomeViewController
//    
//    let navigationController = UINavigationController(rootViewController: homeViewControlller)
//    navigationController.navigationBar.isHidden = true
//    
//    appDelegate.mainViewController.rootViewController = navigationController
//    appDelegate.mainViewController.setup(type: 2)
//    
//    let window = UIApplication.shared.delegate!.window!!
//    window.rootViewController = appDelegate.mainViewController
//    
//    UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
//}
//
//
func logoutFromApp() {
    KeychainService.removePassword(service: Constants.service1, account: Constants.account)
    KeychainService.removePassword(service: Constants.service2, account: Constants.account)
    KeychainService.removePassword(service: Constants.service3, account: Constants.account)
    
    KeychainService.removePassword(service: Constants.userId, account: Constants.account)
        UserDefaults.standard.removeObject(forKey: Constants.fcmToken)
        UserDefaults.standard.synchronize()
    
//    UserDefaults.standard.removeObject(forKey: "medNetworkNo")
//    UserDefaults.standard.removeObject(forKey: Constants.userName)
    UserDefaults.standard.removeObject(forKey: Constants.fcmToken)
//    UserDefaults.standard.setValue("", forKey: Constants.userId)
//    //AppUserDefaults.removeAllValues()
    UserDefaults.standard.synchronize()
    
//    if let appDomain = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: appDomain)
//    }
//    
    
    
//    Messaging.messaging().unsubscribe(fromTopic: "IOS_ALL") { (error) in
//        print(error?.localizedDescription)
//        print("unsubscribed IOS_ALL")
//    }
//    Messaging.messaging().unsubscribe(fromTopic: "IOS_TE") { (error) in
//        print(error?.localizedDescription)
//        print("unsubscribed IOS_TE")
//    }
//    Messaging.messaging().unsubscribe(fromTopic: "IOS_TE_DATA") { (error) in
//        print(error?.localizedDescription)
//        print("unsubscribed IOS_TE_DATA")
//    }
}

func convertDateFormater(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
    
    guard let date = dateFormatter.date(from: date) else {
        assert(false, "no date from string")
        return ""
    }
    
    dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
    let timeStamp = dateFormatter.string(from: date)
    
    return timeStamp
}

func isInternetConnection() -> Bool {
    
    let reachability: Reachability = Reachability.forInternetConnection()
    let networkStatus: NetworkStatus = reachability.currentReachabilityStatus()
    
    reachability.isConnectionRequired()
    
    if(networkStatus == NetworkStatus.NotReachable) {
        return false
    }
    else {
        return true
    }
}

func timeStampToDate(str:String) -> String {
    let unixTimestamp = Double(str)
    let date = Date(timeIntervalSince1970: unixTimestamp!)
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "MMM dd, yyyy" //Specify your format that you want
    let strDate = dateFormatter.string(from: date)
    return strDate
}

func timeStampToDateTimer(str:String) -> String {
    let unixTimestamp = Double(str)
    let date = Date(timeIntervalSince1970: unixTimestamp!)
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "MMM dd, yyyy hh:mm a" //Specify your format that you want
    let strDate = dateFormatter.string(from: date)
    return strDate
}

func timeStampToDateForCalendar(str:String) -> String{
    let unixTimestamp = Double(str)
    let date = Date(timeIntervalSince1970: unixTimestamp!)
    let dateFormatter = DateFormatter()
    
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "MMM dd, yyyy" //Specify your format that you want
    let strDate = dateFormatter.string(from: date)
    return strDate
}

func timeStamp() -> String {
    return "\(Date().timeIntervalSince1970 )"
}

func dateToTimeStamp(strTimeStamp:String) -> String {
    let df = DateFormatter()
    df.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    df.timeZone = NSTimeZone(name: "UTC") as TimeZone!
    let date: Date? = df.date(from: strTimeStamp)
    let since1970: TimeInterval? = date?.timeIntervalSince1970
    let str = "\(since1970!)"
    return str
}

protocol LoginScreenRedirection where Self: UIViewController{
    func observeOnGoToLoginScreen()
    func triggerGoToLoginScreen()
    func removeOberver()
}

class AuthNotifyVC: UIViewController, LoginScreenRedirection {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeOnGoToLoginScreen()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeOberver()
    }
    
    func removeOberver() {
        Constants.notificationCenter.removeObserver(self, name: Constants.loginNotificationName, object: nil)
    }
    
    
    
    func observeOnGoToLoginScreen(){
        Constants.notificationCenter.addObserver(forName: Constants.loginNotificationName, object: nil, queue: nil) { [weak self] _ in
            self?.triggerGoToLoginScreen()
        }
        
    }
    func triggerGoToLoginScreen(){
        guard let window = UIApplication.shared.keyWindow
            else {return}
        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
        let loginVC = storyBoard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController
        window.rootViewController = loginVC
        
        // A mask of options indicating how you want to perform the animations.
        let options: UIView.AnimationOptions = .transitionFlipFromBottom
        
        // The duration of the transition animation, measured in seconds.
        let duration: TimeInterval = 0.3
        
        // Creates a transition animation.
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
            { completed in
                // maybe do something on completion here
        })
        
    }

}

//Helper extension to detect if app is running on a jailbroken device
extension UIDevice {

    private class JailbreakDetector {
        static var current: JailbreakDetector = JailbreakDetector()

        lazy var containsSuspiciousFiles: Bool = {
            return (["/Applications/Cydia.app",
                     "/Library/MobileSubstrate/MobileSubstrate.dylib",
                     "/bin/bash",
                     "/usr/sbin/sshd",
                     "/etc/apt",
                     "/private/var/lib/apt/"].first(where: {
                FileManager.default.fileExists(atPath: $0)
            }) != nil)
        }()
    }

    /// Whether user is using jailbroken device
    var isJailbroken: Bool {
        guard self == UIDevice.current else {
            return false
        }
        
        // Check that we are not using the simulator
        #if arch(i386) || arch(x86_64)
            return false
        #else
            return JailbreakDetector.current.containsSuspiciousFiles
        #endif
    }
}
class InteractivePopRecognizer: NSObject, UIGestureRecognizerDelegate {

    var navigationController: UINavigationController

    init(controller: UINavigationController) {
        self.navigationController = controller
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController.viewControllers.count > 1
    }

    // This is necessary because without it, subviews of your top controller can
    // cancel out your gesture recognizer on the edge.
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

class currentViewController :NSObject{
class func getCurrentViewController() -> UIViewController? {

    // If the root view is a navigation controller, we can just return the visible ViewController
    if let navigationController = getNavigationController() {

        return navigationController.visibleViewController
    }

    // Otherwise, we must get the root UIViewController and iterate through presented views
    if let rootController = UIApplication.shared.keyWindow?.rootViewController {

        var currentController: UIViewController! = rootController

        // Each ViewController keeps track of the view it has presented, so we
        // can move from the head to the tail, which will always be the current view
        while( currentController.presentedViewController != nil ) {

            currentController = currentController.presentedViewController
        }
        return currentController
    }
    return nil
}
class func getNavigationController() -> UINavigationController? {

    if let navigationController = UIApplication.shared.keyWindow?.rootViewController  {

        return navigationController as? UINavigationController
    }
    return nil
}
}
func attributedText(string: String, font: String = "DroidArabicKufi", size: CGFloat = 15, color: UIColor = .black)-> NSMutableAttributedString {
    let font = UIFont(name: font, size: size)
    let attributes: [NSAttributedString.Key: Any] = [
        .font: font ?? UIFont.systemFont(ofSize: 15),
        .foregroundColor: color
    ]
    return NSMutableAttributedString(string: string, attributes: attributes)
}
func + (left: NSMutableAttributedString, right: NSMutableAttributedString) -> NSMutableAttributedString{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
}
