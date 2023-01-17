//
//  AppDelegate.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 3/27/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit
import CoreData

import UserNotifications
import FirebaseInstanceID
import FirebaseMessaging
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
  //  var versionCheckerPresenter: VersionCheckPresenter?
    var window: UIWindow?
    private var launchVC: LaunchVC?
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print(fcmToken)
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
        let savedFCMToken = AppUserDefaults.getUserDefaultValueForKey(key: Constants.fcmToken)
        if(savedFCMToken != fcmToken){
            AppUserDefaults.setUserDefaultValue(value: fcmToken, key: Constants.fcmToken)
        }
      //  checkUserLogin()
        
        
        
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
        //        checkUserLogin()
        //        Messaging.messaging().subscribe(toTopic: "te_iOS") { error in
        ////            print("Subscribed to te_iOS topic")
        //        }
    }
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      Messaging.messaging().apnsToken = deviceToken
    }

    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        //        if let messageID = userInfo[gcmMessageIDKey] {
        //            print("Message ID: \(messageID)")
        //        }
        
        // Print full message.
                print(userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        
        if let messageID = userInfo["gcm.message_id"] {
            //            print("Message ID: \(messageID)")
        }
        
        
        //
        //
        //        let landingStoryboard = UIStoryboard(name: "Landing", bundle: nil)
        //
        ////         instantiate the view controller from storyboard
        //        if  let dashNC = landingStoryboard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController {
        //            let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
        //            let dashBoardVC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.dashBoardVC) as! DashBoardVC
        //            dashNC.pushViewController(dashBoardVC, animated: false)
        //            let storyBoard1 : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home, bundle:nil)
        //            let homeVC  = storyBoard1.instantiateViewController(withIdentifier: "myTabBar") as! UITabBarController
        //            homeVC.selectedIndex = 2
        //
        //            dashNC.pushViewController(homeVC, animated: false)
        //            print(dashNC.children)
        //            // set the view controller as root
        ////            self.window?.rootViewController = dashNC
        //            self.window?.rootViewController = dashNC
        //
        //        }
        //
        //        let storyboard = UIStoryboard(name: "Doctor", bundle: nil)
        //
        //        // instantiate the view controller from storyboard
        //        if  let notificationVC = storyboard.instantiateViewController(withIdentifier: "NotificationViewController") as? NotificationViewController {
        //
        // set the view controller as root
        //        }
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        //        if let messageID = userInfo[gcmMessageIDKey] {
        //            print("Message ID: \(messageID)")
        //        }
        
        // Print full message.
        //        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func setDefaultRootVC(vc: UIViewController) {
//        let landingStoryboard = UIStoryboard(name: "Landing", bundle: nil)
//        let pageVC = landingStoryboard.instantiateViewController(withIdentifier: "pageVC")
        launchVC?.setNavigatationTo(vc: vc)
        
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureFirebase(application: application)
        self.checkForJailbreak()
        
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Landing", bundle: nil)
        let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Login2VC")
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = initialViewControlleripad
        self.window?.makeKeyAndVisible()
        
        
        
        //launchVC = window?.rootViewController as? LaunchVC
        //setDefaultRootVC()
        //print(AppUserDefaults.getUserDefaultValueForKey(key: Constants.skipLandingKey))
        
     //   versionCheckerPresenter = VersionCheckPresenter(versionCheckView: self)
        if let option = launchOptions {
            
            
            
                let info = option[UIApplication.LaunchOptionsKey.remoteNotification]
                if (info != nil) {
                    
              //     didTapNotification()
                }
            
            
            
            
            
            
        }
//        else {
//            checkUserLogin()
//        }
        
        LanguageManager.sharedInstance.setLanuageAs(lan: "ar")
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        
        
        
        //        let statusBarView = UIView()
        
        //        statusBarView.backgroundColor = UIColor(red: 111/255, green: 34/255, blue: 130/255, alpha: 1)
        //        let safeAreaframe = window?.rootViewController?.view.safeAreaFrame
        //       let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        //        statusBarView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: statusBarHeight)
        // Override point for customization after application launch.
        
        return true
    }
    
    func configureFirebase(application: UIApplication) {
        application.registerForRemoteNotifications()
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        FirebaseConfiguration.shared.setLoggerLevel(.min)

        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions) { _, _ in }
    }
    
    
    //For displaying banner message while app is in foreground, use the following method.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //and write below line
        if #available(iOS 14.0, *) {
//            completionHandler([[.banner, .sound]])
        } else {
            completionHandler([.alert, .badge, .sound])

        }
        
        /******/
        
        
        
        //        let userInfo = notification.request.content.userInfo
        //
        //        // With swizzling disabled you must let Messaging know about the message, for Analytics
        //        // Messaging.messaging().appDidReceiveMessage(userInfo)
        //
        //        // Print message ID.
        //        if let messageID = userInfo["gcmMessageIDKey"] {
        //            print("Message ID: \(messageID)")
        //        }
        //
        //        // Print full message.
        //        print(userInfo)
        //
        //        // Change this to your preferred presentation option
        //        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        //        let userInfo = response.notification.request.content.userInfo
        //        // Print message ID.
        //        if let messageID = userInfo["gcmMessageIDKey"] {
        //            print("Message ID: \(messageID)")
        //        }
        //
        //        // Print full message.
        //        print(userInfo)
        
     //   didTapNotification()
        
        //below three lines to remove other notifications from Notification Center after just any one clicked
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications() // To remove all delivered notifications
        
        completionHandler()
    }
    
    
    
    //Exit application gracefully if device is jailbroken
    //2 cases handled here, when app is first launched, and when it goes back to foreground
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if UIDevice.current.isJailbroken {
            UIControl().sendAction(#selector(NSXPCConnection.suspend),
                                   to: UIApplication.shared, for: nil)
        }
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        if UIDevice.current.isJailbroken {
            UIControl().sendAction(#selector(NSXPCConnection.suspend),
                                   to: UIApplication.shared, for: nil)
        }
        if window?.rootViewController is LaunchVC {
            launchVC?.getSupportedVersion()
        }
        
    }
    //
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "weInternet")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
//    func didTapNotification(){
//        let token = KeychainService.loadPassword(service: Constants.service1, account: Constants.account)
//        if(token == nil){
//            let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
//            let login2VC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.login2VC) as! Login2VC
//            self.window?.rootViewController = login2VC
//            self.window?.makeKeyAndVisible()
//        }else{
//            guard let userId = KeychainService.loadPassword(service: Constants.userId, account: Constants.account) else{
//                let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Main, bundle:nil)
//                if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController {
//                    let storyBoardD: UIStoryboard = UIStoryboard(name: "Doctor", bundle: nil)
//                    let homeViewController = storyBoardD.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
//                    dashNC.pushViewController(homeViewController, animated: false)
//                    setDefaultRootVC(vc: dashNC)
//
//
//                }
//
//                return
//            }
//
//                if("\(userId)" == "3"){
//                    Constants.medNetworkNo = 2
//                    let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home
//                        , bundle:nil)
//                    let medicalTEORGlobeVC: MedicalTEORGlobeVC? = storyBoard.instantiateViewController(withIdentifier: "MedicalTEORGlobeVC") as? MedicalTEORGlobeVC
//                    let myNavigationController = UINavigationController(rootViewController: medicalTEORGlobeVC!)
//                    myNavigationController.navigationBar.isHidden = true
//                    setDefaultRootVC(vc: myNavigationController)
//
//                }
//        }
//    }
//    func checkUserLogin() {
////       logoutFromApp()
//
//        let token = KeychainService.loadPassword(service: Constants.service1, account: Constants.account)
//        if(token == nil){
//            let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
//            let login2VC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.login2VC) as! Login2VC
//            setDefaultRootVC(vc: login2VC)
//
//        }else{
//            guard let userId = KeychainService.loadPassword(service: Constants.userId, account: Constants.account) else{
//                let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Main, bundle:nil)
//                if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController {
//                    setDefaultRootVC(vc: dashNC)
////                    self.window?.rootViewController = dashNC
////                    self.window?.makeKeyAndVisible()
//
//                }
//
//                return
//            }
//
//                if("\(userId)" == "3"){
//                    Constants.medNetworkNo = 2
//                    let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home
//                        , bundle:nil)
//                    let medicalTEORGlobeVC: MedicalTEORGlobeVC? = storyBoard.instantiateViewController(withIdentifier: "MedicalTEORGlobeVC") as? MedicalTEORGlobeVC
//                    let myNavigationController = UINavigationController(rootViewController: medicalTEORGlobeVC!)
//                    myNavigationController.navigationBar.isHidden = true
//                    setDefaultRootVC(vc: myNavigationController)
//
//                }
//        }
        
        
        
        
        
        
//        let token = KeychainService.loadPassword(service: Constants.service1, account: Constants.account)
//        if token == nil {
//            let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
//            let login2VC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.login2VC) as! Login2VC
//            self.window?.rootViewController = login2VC
//            self.window?.makeKeyAndVisible()
//        }else{
//             //below is important, userid=3 for ma3ashat part and for ma3ashat medical apis we send 2
//
//
//            let isexist = UserDefaults.exists(key: Constants.userId)
//            if (isexist){
//                let userId = UserDefaults.standard.object(forKey: "userId") as! String
//                if(userId == "3"){
//                                Constants.medNetworkNo = 2
//                                let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home
//                                    , bundle:nil)
//                                let medicalTEORGlobeVC: MedicalTEORGlobeVC? = storyBoard.instantiateViewController(withIdentifier: "MedicalTEORGlobeVC") as? MedicalTEORGlobeVC
//                                let myNavigationController = UINavigationController(rootViewController: medicalTEORGlobeVC!)
//                                myNavigationController.navigationBar.isHidden = true
//                                self.window?.rootViewController = myNavigationController
//                                self.window?.makeKeyAndVisible()
//                //                KeychainService.removePassword(service: Constants.service1, account: Constants.account)
//                //                AppUserDefaults.removeAllValues()
//
//                }else{
//                    let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Main, bundle:nil)
//                    if  let dashNC = storyBoard.instantiateViewController(withIdentifier: "dashNC") as? UINavigationController {
//
//                        self.window?.rootViewController = dashNC
//                        self.window?.makeKeyAndVisible()
//
//                    }
//                }
//            }
//
//            else{
//                let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
//                let login2VC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.login2VC) as! Login2VC
//                self.window?.rootViewController = login2VC
//                self.window?.makeKeyAndVisible()
//            }
//
//        }
   // }
}





//extension AppDelegate: VersionCheckView {
//    func getReachability(isConnected: Bool) {
//
//    }
//
//    func getAppVersionSupportFailure() {
//
//    }
//
//
//    func getAppVersionSupportStatus(shouldUpdate: Bool) {
//        if shouldUpdate {
//            //            CachedDataSource.shared.isUpToDate = false
//            window?.makeKeyAndVisible()
//            //            window = UIWindow(frame: UIScreen.main.bounds)
//
//            //            let currentVC = window?.rootViewController?.children[window!.rootViewController!.children.count - 1]
//            //            print(window?.rootViewController?.children[window!.rootViewController!.children.count - 1].description)
//            let alert = UIAlertController(title: "برجاء تحديث التطبيق ", message: "", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
//                self.versionCheckerPresenter?.goToAppStore()
//            }))
//            window?.rootViewController?.present(alert, animated: true, completion: nil)
//
//
//        }
//    }
//}

extension AppDelegate {
    private func checkForJailbreak() {
        #if !(targetEnvironment(simulator))
        
        // MARK:- Check for Suspicious File
        for path in Constants.suspiciousFilePathes {
            if FileManager.default.fileExists(atPath: path) {
                exit(0)
            }
        }

        
        let stringToBeWritten = "This is a test."
        do {
            try stringToBeWritten.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: .utf8)
            exit(0)
        } catch {
            try? FileManager.default.removeItem(atPath: "/private/jailbreak.txt")
        }
        
        if UIApplication.shared.canOpenURL(URL(string: "cydia://package/com.example.package")!) {
            exit(0)
        } else if UIApplication.shared.canOpenURL(URL(string: "electra://package/com.example.package")!) {
            exit(0)
        }
        
        if let f = fopen("/bin/bash", "r") {
            fclose(f)
            exit(0)
        } else if let f = fopen("/Applications/Cydia.app", "r") {
            fclose(f)
            exit(0)
        } else if let f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r") {
            fclose(f)
            exit(0)
        } else if let f = fopen("/usr/sbin/sshd", "r") {
            fclose(f)
            exit(0)
        } else if let f = fopen("/etc/apt", "r") {
            fclose(f)
            exit(0)
        }
        
        let root = getgid()
        if root <= 10 {
            exit(0)
        }
        
        
        // MARK:- check if debugger attached
        if isDebuggerAttached() {
            exit(0);
        }
        #endif
        
    }
    
    private func isDebuggerAttached() -> Bool {
        var info = kinfo_proc()
        var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        assert(junk == 0, "sysctl failed")
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }

}

//<<<<<<< HEAD
//=======
//class NotificationService: UNNotificationServiceExtension {
//
//    var contentHandler: ((UNNotificationContent) -> Void)?
//    var bestAttemptContent: UNMutableNotificationContent?
//
//    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
//        self.contentHandler = contentHandler
//        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
//        if let bestAttemptContent = bestAttemptContent {
//            guard let body = bestAttemptContent.userInfo["fcm_options"] as? Dictionary<String, Any>, let imageUrl = body["image"] as? String else { fatalError("Image Link not found") }
//            downloadImageFrom(url: imageUrl) { (attachment) in
//                if let attachment = attachment {
//                    bestAttemptContent.attachments = [attachment]
////                  bestAttemptContent.categoryIdentifier = "myNotificationCategory"    //COMMENT IT FOR NOW
//                    contentHandler(bestAttemptContent)
//                }
//            }
//        }
//    }
////MARK: - Image Downloader
//    private func downloadImageFrom(url: String, handler: @escaping (UNNotificationAttachment?) -> Void) {
//        let task = URLSession.shared.downloadTask(with: URL(string: url)!) { (downloadedUrl, response, error) in
//            guard let downloadedUrl = downloadedUrl else { handler(nil) ; return }
//            var urlPath = URL(fileURLWithPath: NSTemporaryDirectory())
//            let uniqueUrlEnding = ProcessInfo.processInfo.globallyUniqueString + ".jpg"
//            urlPath = urlPath.appendingPathComponent(uniqueUrlEnding)
//            try? FileManager.default.moveItem(at: downloadedUrl, to: urlPath)
//            do {
//                let attachment = try UNNotificationAttachment(identifier: "picture", url: urlPath, options: nil)
//                handler(attachment)
//            } catch {
//                print("attachment error")
//                handler(nil)
//            }
//        }
//        task.resume()
//    }
//    override func serviceExtensionTimeWillExpire() {
//        // Called just before the extension will be terminated by the system.
//        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
//        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
//            contentHandler(bestAttemptContent)
//        }
//    }
//
//}
//
//
//extension UserDefaults {
//
//    static func exists(key: String) -> Bool {
//        return UserDefaults.standard.object(forKey: key) != nil
//    }
//
//}
//>>>>>>> 2dd12d896b8ee4c32dc48d0bf7f6a3e2bfc72d59
