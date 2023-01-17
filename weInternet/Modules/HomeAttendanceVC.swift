//
//  HomeAttendanceVC.swift
//  weInternet
//
//  Created by Mohamad Shaikhon on 17/01/2023.
//  Copyright © 2023 ahmedfouad. All rights reserved.
//

import UIKit

class HomeAttendanceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func checkIn(){
        Provider().postRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/checkStatus", withExpectedResponseOfType: CheckInResponseData.self, headers: ["Authorization": Constants.loginToken ?? ""], parameters: ["longitude": "", "latitude": "", "actionTypeId": 1, "logAction": true]) {[weak self] data in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            ShowToast.ShowToast("checked in successfully")
        }
    }
    func checkOut(){
        Provider().postRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/checkStatus", withExpectedResponseOfType: CheckInResponseData.self, headers: ["Authorization": Constants.loginToken ?? ""], parameters: ["longitude": "", "latitude": "", "actionTypeId": 2, "logAction": true]) {[weak self] data in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            ShowToast.ShowToast("checked out successfully")
        }
    }
    func getLogs(){
        Provider().getRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/employeeLogs?ActionTypeID=0&noOfRows=5", AttendanceLogsResponseData.self) {[weak self] data, _  in
            guard let body = data?.body else {
            ShowToast.ShowToast(data?.clientMessage ?? "error")
            return
        }
            
    }
}

struct CheckInResponseData: Codable{
    let body: CheckInResponseDataBody?
    let clientMessage: String?
}
struct CheckInResponseDataBody: Codable{
    let isOnSite: Bool?
}

struct AttendanceLogsResponseData: Codable{
    let timestamp: String?
       let statusCode: Int?
       let status, clientMessage: String?
       let body: [Body]?
}
struct Body: Codable {
    let isOnSite: Bool?
    let longitude, latitude: String?
    let actionTypeID: Int?
    let userName, actionDate, actionTypeName: String?
    let logID: Int?
    let offlineCheckDate: String?
    
    enum CodingKeys: String, CodingKey {
        case isOnSite, longitude, latitude
        case actionTypeID = "actionTypeId"
        case userName, actionDate, actionTypeName
        case logID = "logId"
        case offlineCheckDate
    }
}
