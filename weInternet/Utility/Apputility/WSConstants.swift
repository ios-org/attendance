//
//  WSConstants.swift
//  Service
//
//  Created by Ahmad Fouad on 15/03/17.
//  Copyright © 2017 Junaid. All rights reserved.
//


import UIKit
import Foundation
//Development: "http://192.168.129.128:8070/EmployeeManagement/providertype/all/providertype/1"
//Pre-Production: http://10.19.247.180/RestLayer/
//Pre-Production2: http://weapps.te.eg/RestLayer/
//live: https://weapps.te.eg/RestLayer/


//comment the old one
//http://192.99.247.89:8080/RestLayer/"    >> Cloud server
//var base_Url: String                            = "https://weapps.te.eg/RestLayer/"
//var base_Url: String                            = "https://10.109.20.194/RestLayer/"
//"https://10.109.20.194/RestLayer/"
//producation URL https://hr-api.te.eg/RestLayer/


var base_Url: String                            = "https://hr-api.te.eg/RestLayer/"

let getAdminTokenURL: String = base_Url+"V1/integration/admin/token"
let createCustomerURL: String = base_Url+"V1/customers" //you can make ?fields=email,addresses at the end ot the URL to return only values you need


let loginURL: String                          = base_Url + "authenticate"
let getCitiesURL: String                      = base_Url + "city/all/cities/"
let getAllAreasByCityURL                      = base_Url + "area/all/areas/"
let getSpecializationsByClinicURL             = base_Url + "provider/all/specialization/providertype/"
let getAllProviderTypesURL                    = base_Url + "providertype/all/providers"
//let getProviderTypesByAreaURL                 = base_Url + "providertypeInfo/all/providertypes/areas/"
let searchResultUrl = base_Url + "providertypeInfo/all/providertypes/searchall/AreaArr"
let favoriteListURL = base_Url + "favorite/list"
let deleteFavoriteURL = base_Url + "favorite/deletefav"
let addFavoriteURL = base_Url + "favorite/addfav"
let notificationsURL = base_Url + "Notifications/GetNotificationList/0"
let notificatioSeenUrl = base_Url + "Notifications/MarkNotificationSeen/"
let minimumSupportVersionURL = base_Url + "MinSupportedVer"
let banner = base_Url + "Banner/GetBanner/1000"
let logoutURL = base_Url + "Logout"
let subscribeFCMTokenURL = base_Url + "Notifications/SubscribeToken"
let getAllTopicsURL = base_Url + "Notifications/GetTopicsWithCustomerSelection"
let updateTopicsURL = base_Url + "Notifications/UpdateTopicsSubscription"
let getSurveyListURL = base_Url + "Survey/GetSurveyList"
let getQuestionaireListURL = base_Url + "Questionnaire/GetQuestionnaireList"
let getVotingListURL = base_Url + "Voting/GetVotingList"
let getVotingListDetailsURL = base_Url + "Voting/GetVotingDetail"
let getVotingChartURL = base_Url + "Voting/getVotingStatistic"
let getAddVotingResponseURL = base_Url + "Voting/AddVotingResponse"
let getSurveyDetailsURL = base_Url + "Survey/GetSurveyDetails"
let getQuestionaireDetailsURL = base_Url + "Questionnaire/GetQuestionnaireDetails"
let addSurveyResponseURL = base_Url + "Survey/AddSurveyResponse"
let addQuestionaireResponseURL = base_Url + "Questionnaire/AddQuestionnaireResponse"
let medicalInfoListURL = base_Url + "medicalInformation/getAllMedicalInformation"
let medicalInfoDetailsURL = base_Url + "medicalInformation/getMedicalInformationById"
let notificationDetailsURL = base_Url + "Notifications/GetNotificationById/"
let getAllOfferURL = base_Url + "Benefit/getAllOfferCategory"
let getAllOfferCategoryURL = base_Url + "Benefit/getAllOffers"
let getOfferById = base_Url + "Benefit/getOfferById"
let unSeenNotification = base_Url + "Notifications/GetUnSeenNotificationCount"
let templateLettersListURL = base_Url + "correspondence/getAllCorrespondenceFormByCategory"
let templateLettersCategoriesURL = base_Url + "correspondence/getAllCorrespondenceCategory"
let templateLettersDetailsURL = base_Url + "correspondence/getCorrespondenceFormById"
let jobAnnouncementsURL = base_Url + "jobAnnouncements/getAllJobAnnouncements"
let jobAnnouncementDetailsURL = base_Url + "jobAnnouncements/getJobAnnouncementById"


let newsList = base_Url + "news/getAllNewsByCategory"
let newsDetails = base_Url + "news/getNewsById"
let initives = base_Url + "initiative/getAllInitiatives"
let initivesDetails = base_Url + "initiative/getInitiativeById"
