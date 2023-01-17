//
//  AppUserDefaults.swift
//  Service
//
//  Created by Ahmad Fouad on 15/03/17.
//  Copyright © 2017 Junaid. All rights reserved.
//

import UIKit

class AppUserDefaults: NSObject {
    
    class func setUserDefaultValue(value: String, key:String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setNumberUserDefaultValue(value: NSNumber, key:String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func getUserDefaultValueForKey(key: String) -> (String) {
        
        if let val = UserDefaults.standard.object(forKey: key) {
            return val as! String
        }
        else {
            return ""
        }
    }
    
    class func getNumberUserDefaultValueForKey(key: String) -> (NSNumber) {
        
        if let val = UserDefaults.standard.object(forKey: key) {
            return val as! NSNumber
        }
        else {
            return NSNumber(value:0)
        }
    }
    
    class func setAllValuseInUserDefaults() {

//        self.setUserDefaultValue(value: UserLogin.sharedInstance.userId, key: "userId")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.ContactNumber, key: "ContactNumber")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.age, key: "age")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.city_id, key: "city_id")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.email, key: "email")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.facebookId, key: "facebookId")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.gender, key: "gender")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.name, key: "name")
//        self.setUserDefaultValue(value: UserLogin.sharedInstance.profileImageUrl, key: "profileImageUrl")

    }

    class func getUserDetailFromApplication() {

//        UserClass.sharedInstance.strEmail = self.getUserDefaultValueForKey(key: "EMAIL")
//        UserClass.sharedInstance.strPassword = self.getUserDefaultValueForKey(key: "PASSWORD")
//        UserClass.sharedInstance.strUserId = self.getUserDefaultValueForKey(key: "USERID")
//        UserClass.sharedInstance.strAccessToken = self.getUserDefaultValueForKey(key: "ACCESS_TOKEN")
//        UserClass.sharedInstance.strName = self.getUserDefaultValueForKey(key: "NAME")
//        UserClass.sharedInstance.strImage = self.getUserDefaultValueForKey(key: "image")
//        UserClass.sharedInstance.strPhoneNumber = self.getUserDefaultValueForKey(key: "PHONENUMBER")
//        UserClass.sharedInstance.strNotification = self.getUserDefaultValueForKey(key: "NOTIFICATION")
//        UserClass.sharedInstance.strReferalCode = self.getUserDefaultValueForKey(key: "REFERALCODE")
//        UserClass.sharedInstance.strFBID = self.getUserDefaultValueForKey(key: "FB_ID")
//
//        UserClass.sharedInstance.role = self.getNumberUserDefaultValueForKey(key: "ROLE")
        

    }
    
    class func removeAllValues() {
        
        self.setUserDefaultValue(value: "FALSE", key: "AUTOLOGIN")
        
        self.setUserDefaultValue(value: "", key: "EMAIL")
        self.setUserDefaultValue(value: "", key: "PASSWORD")
        self.setUserDefaultValue(value: "", key: "NAME")
        
        self.setUserDefaultValue(value: "", key: "USERID")
        self.setUserDefaultValue(value: "", key: "image")
        
        self.setUserDefaultValue(value: "", key: "BIO")
        self.setUserDefaultValue(value: "", key: "ACCESS_TOKEN")
        
        self.setUserDefaultValue(value: "", key: "USERNAME")
        self.setUserDefaultValue(value: "", key: "PRIVACYSTATUS")
        
        self.setUserDefaultValue(value: "", key: "PHONENUMBER")
        
        self.setUserDefaultValue(value: "", key: "NOTIFICATION")
        self.setUserDefaultValue(value: "", key: "REFERALCODE")
        self.setUserDefaultValue(value: "", key: "FB_ID")
        self.setUserDefaultValue(value: "", key: "medNetworkNo")
        //self.setUserDefaultValue(value: "", key: Constants.userId)
            
        UserDefaults.standard.synchronize()

//        UserClass.sharedInstance.strUserId = ""
        
        getUserDetailFromApplication()
        
        var strLanguage:String
        strLanguage = AppUserDefaults.getUserDefaultValueForKey(key: "Language")
        if strLanguage == "ar" {
            
            AppUserDefaults.setUserDefaultValue(value: "ar", key: "Language")
            LanguageManager.sharedInstance.setLanuageAs(lan: "ar")
        }else{
            AppUserDefaults.setUserDefaultValue(value: "en", key: "Language")
            LanguageManager.sharedInstance.setLanuageAs(lan: "en")
        }

        

    }
    
}

