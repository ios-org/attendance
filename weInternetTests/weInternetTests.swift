//
//  weInternetTests.swift
//  weInternetTests
//
//  Created by ahmed.fouadgomaa on 3/27/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import XCTest
import Alamofire


class weInternetTests: XCTestCase {

    var resData: Data? = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCalcTip() {
//        let calTip = TipCalc()
//        let tip = calTip.calcTip(amount: 11.0, perc: 50.0)
//        
//        XCTAssert(tip == calTip.defPerc, "wrong value")
    }
    private func processNamesIntoViewableText(rawNames: [String])-> String {
           if rawNames.count < 1 {
               return ""
           }else if rawNames.count == 1 {
               return rawNames[0]
           }else{
               return rawNames.reduce(""){$0 + "+" + $1}
               
           }
       }
    func testExample() {
       print (processNamesIntoViewableText(rawNames: ["سوهاج","الجيزه","يبيس","ححح"]))
    }
    
    
    
    func testLogin() {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        XCTAssertNotNil(sb, "Storyboard couldn't be intiated")
//        guard let vc = sb.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {
//            XCTAssert(false, "Login View Controller couldn't be intiated")
//            return
//        }
//        _ = vc.view
//        let txt1 = vc.txtUsername.text
//        let txt2 = vc.txtPassword.text
//
//        XCTAssert(txt1 == txt2, "not equal texts")
        
        let url = "https://mytedata.net/services/rest/login/checkPassword"
        
        Alamofire.request(url).responseJSON { (responseData) in
            
           self.resData = responseData.data
            
            switch responseData.result{
            case .success:
                print(responseData.result.value!)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 50.0)
        
        
        if res == XCTWaiter.Result.completed{
            XCTAssertNotNil(resData, "No data returned")
        }else{
            XCTAssert(false, "failed")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
