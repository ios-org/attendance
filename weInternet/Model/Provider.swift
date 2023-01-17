//
//  Alamo.swift
//  AlamofireNetworkingTemp
//
//  Created by Mohamed Shaikhon on 7/2/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import Foundation
import Alamofire
import MBProgressHUD

struct Provider {
    let jsonEncodingDefault = JSONEncoding.default
    let urlEncodingDefault = URLEncoding.default
    
    private func alamofireRequestWith(url: String,
                                      method: HTTPMethod = .get,
                                      headers: [String: String] = [:],
                                      params: [String: Any] = [:],
                                      parameterEncoding: ParameterEncoding = JSONEncoding.default,
                                      vaildationRange: Range<Int> = 200..<300,
                                      completion: @escaping (_ response: Data?)->()){
        if method == .post{
            
            Alamofire.request(url,
                              method: method,
                              parameters: params, encoding: parameterEncoding, headers: headers
            )
            .validate(statusCode: vaildationRange)
            
            .responseJSON { response in
                print(response.response?.statusCode)
                print(response.result)
                switch response.result {
                case .success:
                    //                    print(response.description)
                    completion(response.data)
                case.failure(let error):
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    
                }
            }
        }else{
            
            Alamofire.request(url,
                              method: method,
                              encoding: parameterEncoding, headers: headers
            )
            .validate(statusCode: vaildationRange)
            
            .responseJSON { response in
                print(response.response?.statusCode)
                print(response.result)
                switch response.result {
                case .success:
                    //                    print(response.description)
                    completion(response.data)
                case.failure(let error):
                    debugPrint(error.localizedDescription)
                    completion(nil)
                    
                }
            }
        }
        
    }
    
    func parseJSON<ParsedResponseType: Decodable>(response: Data) -> ParsedResponseType? {
        do {
            let parsedResponse: ParsedResponseType = try JSONDecoder().decode(ParsedResponseType.self, from: response)
            return parsedResponse
            
        } catch(let err) {
            
//            debugPrint("json parsing error: ", err.localizedDescription)
        }
        
        return nil
    }
    
    func getRequest<ExpectedParsedJsonType: Decodable>(url: String,
                                                       _: ExpectedParsedJsonType.Type,
                                                       headers: [String:String] = [:],
                                                       validationRange: Range<Int> = 200 ..< 300,
                                                       completion: @escaping (ExpectedParsedJsonType?, Bool)->()) {
        if isInternetConnection() {
//            ShowActivityIndicatorInStatusBar(shouldShowHUD: true)
        alamofireRequestWith(url: url,
                             method: .get,
                             headers: headers,
                             vaildationRange: validationRange) { responseData in
//                                self.HideActivityIndicatorInStatusBar()
//                                print(responseData ?? "")
                                
                                guard let responseData = responseData else {
                                    completion(nil,true)
                                    return
                                }
                                let parsedObj: ExpectedParsedJsonType? = self.parseJSON(response: responseData)
                                completion(parsedObj,true)
        }
        }else {
           completion(nil,false)
        }
    }

    func postRequest<ExpectedParsedJsonType: Decodable>(url: String,
                                                        withExpectedResponseOfType: ExpectedParsedJsonType.Type,
                                                        headers: [String:String] = [:],
                                                        parameters: [String: Any] = [:],
                                                        parameterEncoding: ParameterEncoding = URLEncoding.default,
                                                        validationRange: Range<Int> = 200 ..< 300,
                                                        completion: @escaping (ExpectedParsedJsonType?)->()) {
        ShowActivityIndicatorInStatusBar(shouldShowHUD: true)
        
        alamofireRequestWith( url: url,
                              method: .post,
                              headers: headers,
                              params: parameters,
                              vaildationRange: validationRange) { responseData in
//                                print(responseData ?? "")
                                self.HideActivityIndicatorInStatusBar()
                                guard let responseData = responseData else {
                                    completion(nil)
                                    return
                                }
                                let parsedObj: ExpectedParsedJsonType? = self.parseJSON(response: responseData)
                                completion(parsedObj)
        }
    }
     func ShowActivityIndicatorInStatusBar( shouldShowHUD : Bool ) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if (shouldShowHUD == true) {
            let window = UIApplication.shared.keyWindow!
            let progressHUD = MBProgressHUD.showAdded(to: window, animated: true)
            progressHUD.label.text = "Loading...".localized()
        }
    }
    
     func HideActivityIndicatorInStatusBar() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        MBProgressHUD.hide(for: UIApplication.shared.keyWindow!, animated: true)
    }

}



