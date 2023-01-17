////
////  MainRequestClass.swift
////  Service
////
////  Created by Ahmad Fouad on 15/03/17.
////  Copyright © 2017 ahmedfouad. All rights reserved.
////
//
import UIKit
import Alamofire
import MBProgressHUD
import Reachability
func getHeaderData() -> Dictionary<String, String> {
    
    let loadedTokenFromKC =  KeychainService.loadPassword(service: Constants.service1, account: Constants.account)
    var params = [String:String] ()
    
    if let loginToken = Constants.loginToken {
        let token = "Bearer " + loginToken
        params = ["Authorization":token]
    }else{
        if loadedTokenFromKC !=  nil {
            let token = "Bearer " + (loadedTokenFromKC ?? "")
            params = ["Authorization":token]
            //        print("HEADER: \(params)")
        }
        else {
            let token = "Bearer " + ""
            params = ["Accept": "application/json","Authorization":token]
            //        print("HEADER: \(params)")
        }
    }
    return params
}
//Concrete generic error to throw
public struct MyError: Error {
    
}

class MainReqeustClass {
    var sessionManager: SessionManager?

    static let BaseRequestSharedInstance = MainReqeustClass()
    private init() {
        //enableCertificatePinning()
        
        if let constantsPlistPath = Bundle.main.path(forResource: "Configurations", ofType: "plist") {
            let constantsDic = NSDictionary(contentsOfFile: constantsPlistPath)
            if (constantsDic?.value(forKey: "Development") as? Bool) == true {
                sessionManager = SessionManager(delegate:SessionDelegate(), serverTrustPolicyManager:MyServerTrustPolicyManager(policies: [:]))
            }else if (constantsDic?.value(forKey: "Producation") as? Bool) == true {
                enableCertificatePinning()
            }
        }

    }
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }
    
    //MARK: - WS CALLS Methods
    private func enableCertificatePinning() {

//        let trustPolicy = ServerTrustPolicy.pinCertificates(
//            certificates: certificates,
//            validateCertificateChain: true,
//            validateHost: true)
//        let trustPolicies = [ "hr-api.te.eg": trustPolicy ]
        let policyManager =  ServerTrustPolicyManager(policies: getserverTrustPolicies())
        let serverTrustPolicies = getserverTrustPolicies()
        sessionManager = SessionManager(configuration: .default, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    }
    func getserverTrustPolicies() -> [String : ServerTrustPolicy] {
            let myServer = "hr-api.te.eg"
            
            let pathToCert = Bundle.main.path(forResource: "te.eg", ofType: "der")
            let localCertificate = NSData(contentsOfFile: pathToCert!)!
        let cert = SecCertificateCreateWithData(nil, localCertificate as NSData)
            let serverTrustPolicy = ServerTrustPolicy.pinCertificates(
                certificates: [cert!],
                validateCertificateChain: true,
                validateHost: true
            )
            
            let serverTrustPolicies = [
                myServer: serverTrustPolicy
            ]
            
            return serverTrustPolicies
            
        }
    private func getCertificates() -> [SecCertificate] {
        let url = Bundle.main.url(forResource: "te.eg", withExtension: "der")!
        let localCertificate = try! Data(contentsOf: url) as CFData
        guard let certificate = SecCertificateCreateWithData(nil, localCertificate)
        else { return [] }
        
        return [certificate]
    }
    
    
    
    //    private func enableCertificatePinning() {
    //        let certificates: [SecCertificate] = []
    //        let trustPolicy = ServerTrustPolicy.pinCertificates(
    //            certificates: certificates,
    //            validateCertificateChain: true,
    //            validateHost: true)
    //        let trustPolicies = [ "www.apple.com": trustPolicy ]
    //        let policyManager =  ServerTrustPolicyManager(policies: trustPolicies)
    //        sessionManager = SessionManager(
    //            configuration: .default,
    //            serverTrustPolicyManager: policyManager)
    //    }
    
    func POSTRequset(showLoader: Bool, url:String, headers: [String: String]? = getHeaderData(), parameter:[String : Any]?, success:@escaping (AnyObject?,Int?) -> Void, failed:@escaping (String?) -> Void) {
        //        enableCertificatePinning()
        print("hellzo")
        if(isInternetConnection() == true) {
            
            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: showLoader)
            
            sessionManager!.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).validate(statusCode: 200...401).responseJSON { (responseData) in
                print("##############################################################################")
                print("URL: \(url)")
                print("PARAMS: \(String(describing: parameter))")
                print("Method: Post")
                print("RESPONSE: \(String(describing: responseData.result.value))")
                print("##############################################################################")
                //
                MainReqeustClass.HideActivityIndicatorInStatusBar()
                //                print(responseData.response?.statusCode as Any)
                
                switch responseData.result{
                case .success:
                    //                    print(responseData.result.value!)
                    
                    
                    let responseString = String(data: responseData.data!, encoding: String.Encoding.utf8)
                    //                    print(responseString!)
                    if let statusCode: Int = responseData.response?.statusCode{
                        if 200 ... 299 ~= statusCode {
                            print(responseData.data)
                            
                            success(responseData.data as AnyObject,nil)
                        }else{
                            if statusCode == 401 {
                                success(responseData.data as AnyObject,statusCode)
                            }else{
                                do {
                                    let decoder = JSONDecoder()
                                    let apiErrorResponse = try decoder.decode(APIException.self, from: responseData.data!)
                                    //ShowToast.ShowToast(apiErrorResponse.arabicMessage)
                                    
                                    //                                print(apiErrorResponse.arabicMessage)
                                    success(apiErrorResponse as AnyObject,statusCode)
                                    //                                    ShowToast.ShowToast(apiErrorResponse.arabicMessage)
                                    
                                } catch let error {
                                    //                                print(error)
                                }
                            }
                            
                        }
                    }
                    
                case .failure(let error):
                    //failed(error.localizedDescription)
                    
                    
                    if (responseData.response?.statusCode == 500){
                        if let data = responseData.data {
                            do {
                                let xx = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                failed(xx!["arabicMessage"] as? String)
                            } catch {
                                ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                            }
                        }else{
                            ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                        }
                    }else{
                        ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                    }
                    
                    
                    
                    //                    if error._code == NSURLErrorTimedOut {
                    //                        //HANDLE TIMEOUT HERE
                    //                        print(error.localizedDescription)
                    //                        ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                    //                    }
                    
                    //                    failed(error)
                    //                    print("\n\nAuth request failed with error:\n \(error)")
                    break
                    
                }
                
            }
        }else {
            ShowToast.ShowToast("عفوا, لا يوجد اتصال بالإنترنت")
            
        }
    }
    
    
    
    func GETRequset(showLoader: Bool, url:String, parameter:[String : AnyObject]?, success:@escaping (AnyObject?,Int?) -> Void, failed:@escaping (String?) -> Void) {
        //        enableCertificatePinning()
        if(isInternetConnection() == true) {
            
            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: showLoader)
            
            sessionManager!.request(url, method: .get, parameters: parameter, encoding: JSONEncoding.default, headers: getHeaderData()).responseJSON { (responseData) in
                //            Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseData) in
                //
                print("##############################################################################")
                print("URL: \(url)")
                print("PARAMS: \(String(describing: parameter))")
                print("Method: Get")
                print("RESPONSE: \(String(describing: responseData.result.value))")
                print("##############################################################################")
                
                MainReqeustClass.HideActivityIndicatorInStatusBar()
                
                print(responseData.response?.statusCode)
                switch responseData.result{
                case .success:
                    //                    print(responseData.result.value!)
                    
                    let responseString = String(data: responseData.data!, encoding: String.Encoding.utf8)
                    //                    print(responseString!)
                    if let statusCode: Int = responseData.response?.statusCode{
                        if 200 ... 299 ~= statusCode {
                            success(responseData.data as AnyObject,nil)
                        }else{
                            if statusCode == 401 {
                                success(responseData.data as AnyObject,statusCode)
                            }else{
                                do {
                                    let decoder = JSONDecoder()
                                    let apiErrorResponse = try decoder.decode(APIException.self, from: responseData.data!)
                                    //                                    print(apiErrorResponse.arabicMessage)
                                    //                                    success(apiErrorResponse as AnyObject,statusCode)
                                    ShowToast.ShowToast(apiErrorResponse.arabicMessage)
                                    
                                } catch let error {
                                    failed(error.localizedDescription)
                                    //                                    if statusCode == 401 {
                                    //                                        //                                    success(nil,statusCode)
                                    //
                                    //                                    }else{
                                    //                                        print(error)
                                    ShowToast.ShowToast("عفوا، تعذر الاتصال")
                                    //
                                    //                                    }
                                }
                            }
                        }
                    }
                    
                case .failure(let error):
                    //failed(error.localizedDescription)
                    
                    
                    if (responseData.response?.statusCode == 500){
                        if let data = responseData.data {
                            do {
                                let xx = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                failed(xx!["arabicMessage"] as? String)
                            } catch {
                                ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                            }
                        }else{
                            ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                        }
                    }else{
                        ShowToast.ShowToast("حدث خطأ أثناء الإتصال، من فضلك حاول مرة أخري")
                    }
                    break
                    
                }
            }
        }else {
            ShowToast.ShowToast("عفوا, لا يوجد اتصال بالإنترنت")
        }
    }
    
    
    // note that the below method is very easy, don't worry
    //https://stackoverflow.com/questions/41499768/upload-multiple-images-in-swift-using-alamofire
    func UploadMultipleImages(showLoader: Bool, url: String, parameters: [String: AnyObject]?, imageArray: [AnyObject]?, success:@escaping (AnyObject?) -> Void, failed:@escaping (AnyObject!) -> Void) {
        
        if(isInternetConnection() == true) {
            
            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: showLoader)
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                if ((imageArray?.count)! > 0) {
                    
                    for i in 0..<imageArray!.count {
                        
                        let docname = "image[\(i)]"
                        
                        multipartFormData.append(imageArray?[i] as! Data, withName: docname, fileName: "myImage.jpg", mimeType: "image/jpg")
                        
                    }
                }
                
                for (key, value) in parameters! {
                    multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                }
                
            },usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
            to:url,
            method: .post,
            headers: getHeaderData(),
            encodingCompletion: { encodingResult in
                
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.uploadProgress(closure: { (Progress) in
                        //                        print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    upload.responseJSON { response in
                        
                        //                        print("##############################################################################")
                        //                        print("URL: \(url)")
                        //                        print("PARAMS: \(String(describing: parameters))")
                        //                        print("Method: Get")
                        //                        print("RESPONSE: \(String(describing: response.result.value))")
                        //                        print("##############################################################################")
                        
                        
                        if response.result.value != nil {
                            DispatchQueue.main.async {
                                MainReqeustClass.HideActivityIndicatorInStatusBar()
                            }
                        }
                        
                        success(response.result.value as AnyObject?)
                    }
                case .failure(let encodingError):
                    
                    //                    print("##############################################################################")
                    //                    print("URL: \(url)")
                    //                    print("PARAMS: \(String(describing: parameters))")
                    //                    print("Method: Get")
                    //                    print("Error: \(String(describing: encodingError))")
                    //                    print("##############################################################################")
                    //                    print(encodingError)
                    break
                }
            })
            
        }
    }
    
    func UploadSingleImages(showLoader: Bool, url: String, parameters: [String: AnyObject]?, img:UIImage, success:@escaping (AnyObject!) -> Void, failed:@escaping (AnyObject!) -> Void) {
        
        if(isInternetConnection() == true) {
            
            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: showLoader)
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                if let imageData = img.jpegData(compressionQuality: 0.6) {
                    multipartFormData.append(imageData, withName: "image", fileName: "myImage.jpg", mimeType: "image/jpg")
                }
                
                for (key, value) in parameters! {
                    multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                }
                
            },usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
            to:url,
            method: .post,
            headers: getHeaderData(),
            encodingCompletion: { encodingResult in
                
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.uploadProgress(closure: { (Progress) in
                        //                        print("Upload Progress: \(Progress.fractionCompleted)")
                    })
                    upload.responseJSON { response in
                        
                        //                        print("##############################################################################")
                        //                        print("URL: \(url)")
                        //                        print("PARAMS: \(String(describing: parameters))")
                        //                        print("Method: Get")
                        //                        print("RESPONSE: \(String(describing: response.result.value))")
                        //                        print("##############################################################################")
                        
                        if response.result.value != nil {
                            DispatchQueue.main.async {
                                MainReqeustClass.HideActivityIndicatorInStatusBar()
                            }
                        }
                        
                        success(response.result.value as AnyObject?)
                    }
                case .failure(let encodingError):
                    break
                //                    print("##############################################################################")
                //                    print("URL: \(url)")
                //                    print("PARAMS: \(String(describing: parameters))")
                //                    print("Method: Get")
                //                    print("Error: \(String(describing: encodingError))")
                //                    print("##############################################################################")
                //                    print(encodingError)
                }
            })
            
        }
    }
    func download(fileURL: URL, success:@escaping (URL?,Int?) -> Void, failed:@escaping (String?) -> Void) {
    //        enableCertificatePinning()
            if(isInternetConnection() == true) {
                MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: true)
               
        Alamofire.download(fileURL).response { response in
            MainReqeustClass.HideActivityIndicatorInStatusBar()
            print(response)
            if let fileURL = response.temporaryURL {
                success(fileURL, response.response?.statusCode)
            }else{
                failed("تعذر تنزيل الملف")
            }
        }
    }else {
        ShowToast.ShowToast("عفوا, لا يوجد اتصال بالإنترنت")
    }
}
//=======
//        //        enableCertificatePinning()
//        if(isInternetConnection() == true) {
//            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: true)
//
//            Alamofire.download(fileURL).response { response in
//                MainReqeustClass.HideActivityIndicatorInStatusBar()
//                print(response)
//                if let fileURL = response.temporaryURL {
//                    success(fileURL, response.response?.statusCode)
//                }else{
//                    failed("تعذر تنزيل الملف")
//                }
//            }
//        }else {
//            ShowToast.ShowToast("عفوا, لا يوجد اتصال بالإنترنت")
//        }
//    }
//>>>>>>> origin/hotfix/forLabib
    
    //MARK: - OTHER METHODS
    func payfortPost(showLoader: Bool, url:String, parameter:[String : AnyObject]?, success:@escaping (AnyObject!) -> Void, failed:@escaping (AnyObject!) -> Void) {
        
        if(isInternetConnection() == true) {
            
            MainReqeustClass.ShowActivityIndicatorInStatusBar(shouldShowHUD: showLoader)
            
            Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseData) in
                //
                //                print("##############################################################################")
                //                print("URL: \(url)")
                //                print("PARAMS: \(String(describing: parameter))")
                //                print("Method: Post")
                //                print("RESPONSE: \(String(describing: responseData.result.value))")
                //                print("##############################################################################")
                
                MainReqeustClass.HideActivityIndicatorInStatusBar()
                if responseData.result.isSuccess {
                    if let value = responseData.result.value {
                        success(value as AnyObject?)
                    }
                    else {
                        failed("Oops.. There seem to be a problem with server. We are sorry for inconvenience.".localized() as AnyObject!)
                    }
                }
                else {
                    failed("Oops.. There seem to be a problem with server. We are sorry for inconvenience.".localized() as AnyObject!)
                }
            }
        }
    }
    
    
    //MARK: - Progress HUD Methods
    class func ShowActivityIndicatorInStatusBar( shouldShowHUD : Bool ) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if (shouldShowHUD == true) {
            let window = UIApplication.shared.keyWindow!
            let progressHUD = MBProgressHUD.showAdded(to: window, animated: true)
            progressHUD.label.text = "Loading...".localized()
        }
    }
    
    class func HideActivityIndicatorInStatusBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        MBProgressHUD.hide(for: UIApplication.shared.keyWindow!, animated: true)
    }
}


