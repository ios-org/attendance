//
//  KeychainService.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 10/10/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//
import Foundation
import Security

// see https://stackoverflow.com/a/37539998/1694526
// Arguments for the keychain queries
let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)


public class KeychainService: NSObject {
    
    class func updatePassword(service: String, account:String, data: String) {
        if let dataFromString: Data = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue])
            
            let status = SecItemUpdate(keychainQuery as CFDictionary, [kSecValueDataValue:dataFromString] as CFDictionary)
            
            if (status != errSecSuccess) {
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
//                        print("Read failed: \(err)")
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
    
    class func removePassword(service: String, account:String) {
        
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue])
        
        // Delete any existing items
        let status = SecItemDelete(keychainQuery as CFDictionary)
        if (status != errSecSuccess) {
            if #available(iOS 11.3, *) {
                if let err = SecCopyErrorMessageString(status, nil) {
//                    print("Remove failed: \(err)")
                }
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
    
    
    class func savePassword(service: String, account:String, data: String) {
        if let dataFromString = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            // Instantiate a new default keychain query
            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
            
            // Add the new keychain item
            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
            
            if (status != errSecSuccess) {    // Always check the status
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
//                        print("Write failed: \(err)")
                    }
                        if(status == errSecDuplicateItem){
                            updatePassword(service: service, account: account, data: data)
                        }
                    
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
//    class func saveUsername(service: String, account:String, data: String) {
//        if let dataFromString = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
//            
//            // Instantiate a new default keychain query
//            let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
//            
//            // Add the new keychain item
//            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
//            
//            if (status != errSecSuccess) {    // Always check the status
//                if let err = SecCopyErrorMessageString(status, nil) {
//                    print("Write failed: \(err)")
//                    if(status == errSecDuplicateItem){
//                        updatePassword(service: Constants.service, account: Constants.account, data: data)
//                    }
//                }
//            }
//        }
//    }
    class func loadPassword(service: String, account:String) -> String? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, account, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        var contentsOfKeychain: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
//            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
    
}
