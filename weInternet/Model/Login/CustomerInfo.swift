//
//  UserInfo.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 4/1/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import Foundation

class CustomerInfo: NSObject{
    
    static let sharedInstance = CustomerInfo()
    
    var password: String!
    
    var adslSpeed: String!
    var cityEN: String!
    var cityAR: String!
    var districtEN: String!
    var districtAR: String!
    var buildingNumber: String!
    var streetName: String!
    var flatNumber: String!
    var gender: String!
    var contactLanguage: String!
    var homePhoneAreaCode: String!
    var homePhoneNumber: String!
    var workPhoneAreaCode: String!
    var workPhoneNumber: String!
    var faxAreaCode: String!
    var faxNumber: String!
    var male: Bool!
    var birthDate: Date!
    var mobileNumber1WithPrefix: String!
    var mobileNumber2WithPrefix: String!
    var customerNumber: String!
    var emailAddress: String!
    var adslAreaCode: Int!
    var adslNumber: Int!
    var mobileNumber1: String!
    var activated: Bool!
    var blackListed: Bool!
    var abuser: Bool!
    var directCustomer: Bool!
    var ftthcustomer: Bool!
    var staffcustomer: Bool!
    var customerName: String!
    var mobilePrefix1: String!
    var mobilePrefix2: String!
    var mobileNumber2: String!
    var limitationTypeId: Int!
    var lineOwnerName: String!
    var limitationTypeName: String!
    var autoRenewalType: String!
    var serviceID: Int!
    var serviceName: String!
    var categoryID: Int!
    var soapRequest: String!
    var soapResponse: String!
}


struct CustomerInfoStr: Codable{
    var customerInformationDto: CustomerInformationDto
}

struct CustomerInformationDto: Codable {
    
    var adslSpeed: String
    var cityEN: String
    var cityAR: String
    var districtEN: String
    var districtAR: String
    var buildingNumber: String
    var streetName: String
    var flatNumber: String
    var gender: String
    var contactLanguage: String
    var homePhoneAreaCode: String
    var homePhoneNumber: String
    var workPhoneAreaCode: String
    var workPhoneNumber: String
    var faxAreaCode: String
    var faxNumber: String
    var male: Bool
    var birthDate: Date
    var mobileNumber1WithPrefix: String
    var mobileNumber2WithPrefix: String
    var customerNumber: String
    var emailAddress: String
    var adslAreaCode: Int
    var adslNumber: Int
    var mobileNumber1: String
    var activated: Bool
    var blackListed: Bool
    var abuser: Bool
    var directCustomer: Bool
    var ftthcustomer: Bool
    var staffcustomer: Bool
    var customerName: String
    var mobilePrefix1: String
    var mobilePrefix2: String
    var mobileNumber2: String
    var limitationTypeId: Int
    var lineOwnerName: String
    var limitationTypeName: String
    var autoRenewalType: String
    var serviceID: Int
    var serviceName: String
    var categoryID: Int
    var soapRequest: String
    var soapResponse: String
}

struct LoginRes: Codable{
    var token: String?
    var userType: String?
    var userId: Int?
    var name: String?
}



struct SubscribeFCMTokenModel: Codable{

  var actionDone: Bool?
  var arabicMessage: String?
  var englishMessage: String?
}
