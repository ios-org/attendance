//
//  HomeAttendanceVC.swift
//  weInternet
//
//  Created by Mohamad Shaikhon on 17/01/2023.
//  Copyright © 2023 ahmedfouad. All rights reserved.
//

import UIKit
import CoreLocation
class HomeAttendanceVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var employeeStatusButton: UIButton!
    @IBOutlet weak var logsTableView: UITableView!
    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var checkInButton: UIButton!
    var attendanceLogs: [Body]?
    var locationManager = CLLocationManager()
    var lat: Double = 0
    var lng: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTheLocationManager()
        getLogs()
        
    }
    
    @IBAction func didTapGetEmployeeStatusButton(_ sender: Any) {
        checkStatus()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logcell", for: indexPath)
//        cell.textLabel?.text = (attendanceLogs?[indexPath.row].actionTypeName ?? "") + "\n" + (attendanceLogs?[indexPath.row].actionDate ?? "") ?? ""
        
        cell.textLabel?.numberOfLines = 0
        let x = "\(attendanceLogs?[indexPath.row].actionTypeName ?? "") \n \(attendanceLogs?[indexPath.row].actionDate?.toDateAmPm() ?? "")"
        cell.textLabel?.text = x
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        attendanceLogs?.count ?? 0
    }
    @IBAction func didTapCheckInButton(_ sender: Any) {
        checkIn()
    }
    @IBAction func didTapCheckOutButton(_ sender: Any) {
        checkOut()
    }
    func checkIn(){
        Provider().postRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/checkStatus", withExpectedResponseOfType: CheckInResponseData.self, headers: ["Authorization": "Bearer " + (Constants.loginToken ?? "") ], parameters: ["longitude": lng, "latitude": lat, "actionTypeId": 1, "logAction": true]) { data in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            ShowToast.ShowToast("checked in successfully")
        }
    }
    func checkStatus(){
        Provider().postRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/checkStatus", withExpectedResponseOfType: CheckInResponseData.self, headers: ["Authorization": "Bearer " + (Constants.loginToken ?? "") ], parameters: ["longitude": lng, "latitude": lat, "actionTypeId": 3, "logAction": true]) {[weak self] data in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            self?.employeeStatusButton.setTitle((body.isOnSite ?? false) ? " \(body.siteName ?? "")" : " Not in site", for: .normal)
            self?.employeeStatusButton.setImage(UIImage(named: (body.isOnSite ?? false) ? "availableIcon-1" : "unavilableIcon"), for: .normal)
        }
    }

    func checkOut(){
        Provider().postRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/checkStatus", withExpectedResponseOfType: CheckInResponseData.self, headers: ["Authorization": "Bearer " + (Constants.loginToken ?? "") ?? ""], parameters: ["longitude": lng, "latitude": lat, "actionTypeId": 2, "logAction": true]) {[weak self] data in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            ShowToast.ShowToast("checked out successfully")
        }
    }
    func getLogs(){
        Provider().getRequest(url: "http://ec2-3-234-225-67.compute-1.amazonaws.com:8080/attendance/employeeLogs?ActionTypeID=0&noOfRows=5", AttendanceLogsResponseData.self, headers: ["Authorization": "Bearer " + (Constants.loginToken ?? "") ?? ""]) {[weak self] data, _  in
            guard let body = data?.body else {
                ShowToast.ShowToast(data?.clientMessage ?? "error")
                return
            }
            self?.attendanceLogs = body
            self?.logsTableView.reloadData()
        }
    }
}

struct CheckInResponseData: Codable{
    let body: CheckInResponseDataBody?
    let clientMessage: String?
}
struct CheckInResponseDataBody: Codable{
    let isOnSite: Bool?
    let siteName: String?
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
extension HomeAttendanceVC: CLLocationManagerDelegate{
    func initializeTheLocationManager() {
        locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locationManager.location?.coordinate
        if lat == 0 || lng == 0 {
            lat = location?.latitude ?? 0
            lng = location?.longitude ?? 0

//            ChefaaInCartProducts.shared.userLocationLatLng = latLng
        }
        locationManager.distanceFilter = 100

    }
func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .denied || status == .restricted {
//            showMessage(message: "تعذر الحصول على موقعك الحالي", messageType: .error)
//            locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }else{
        locationManager.startUpdatingLocation()
    }
    if status == .notDetermined {
//            locationManager.requestLocation()
        locationManager.stopUpdatingLocation()
    }
}
func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestLocation()
    locationManager.stopUpdatingLocation()
    
//    showAlert(title: "الإعدادات", message: "من فضلك قم بإتاحة الوصول لموقعك الحالي  ", preferredStyle: .alert, action: UIAlertAction(title: "متابعة", style: .default, handler: { ـ in
//        UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
//        self.navigationController?.popViewController(animated: false)
//
//    }), completion: nil)
}
    /// Show an alert on the view controller.
//    func showAlert(title: String? = nil, message: String? = nil, preferredStyle: UIAlertController.Style = .alert, action: UIAlertAction, completion: (() -> Void)? = nil) {
//        showAlert(title: title, message: message, preferredStyle: preferredStyle, action: action, completion: completion)
//    }
    
}

extension String{
    func toDateAmPm(incrementHoursBy: Int = 0)->String?{
//        guard let isoDate = toDateISO() else {return self}
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "en_eg")
        formatter.dateStyle = .full
//        formatter.calendar.date(byAdding: .hour, value: 2, to: toDate()!)
        formatter.timeStyle = .medium
        let date = formatter.string(from: formatter.calendar.date(byAdding: .hour, value: incrementHoursBy, to: toDate()!)!)
        return date
    }
    
    func toDate()-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: self)
    }
}
