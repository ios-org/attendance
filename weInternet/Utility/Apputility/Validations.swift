//
//  Validations.swift
//  Service
//
//  Created by Ahmad Fouad on 31/01/17.
//  Copyright © 2017 Junaid. All rights reserved.
//

import UIKit

func changePasswordValidation(_ oldPass:String, newPass:String, confPass:String,PasswordMinimumLenght:Int, PasswordMaximumLenght:Int) -> Bool {
    
    let strPassword = oldPass.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     let strNewPassword = newPass.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strConfirmPassword = confPass.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
//    if (isStringEmpty(strPassword)) {
//        ShowToast.ShowToast(AlertMsg.OldPass_Blank)
//    }
//    else if(isStringEmpty(strNewPassword)) {
//        ShowToast.ShowToast(AlertMsg.NewPass_Blank)
//    }
//    else if(isStringEmpty(strConfirmPassword)) {
//        ShowToast.ShowToast(AlertMsg.ConfirmPass_Blank)
//    } else if(PasswordMinimumLenght > strNewPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Minimum)
//    }
//    else if(PasswordMaximumLenght < strNewPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Maximum)
//    }
//    else if(!isValidPasswordAndConfirmPass(newPass, confirmPassword: confPass)) {
//        ShowToast.ShowToast(AlertMsg.Pass_not_Match)
//    }
//    else {
//        return true
//    }
    
    return false
    
}

func ForgotPasswordValidation(_ email:String) -> Bool {
     let strEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
//    if (isStringEmpty(strEmail)) {
//        ShowToast.ShowToast(AlertMsg.Email_Blank)
//    }
//    else if(!validateEmail(strEmail as String)) {
//        ShowToast.ShowToast(AlertMsg.Email_Invalid)
//    }
//    else {
//        return true
//    }
    return false
}


func registrationValidation(_ fullName:String, email:String, password:String,  PasswordMinimumLenght:Int, PasswordMaximumLenght:Int, Confirpassword:String) -> Bool {
    
     let strEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     let strPassword = password.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     let strConfirmPassword = Confirpassword.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    
//    if (isStringEmpty(fullName)) {
//        ShowToast.ShowToast(AlertMsg.FullName_Blank)
//    }
//    else if(isStringEmpty(strEmail)) {
//        ShowToast.ShowToast(AlertMsg.Email_Blank)
//    }
//    else if(!validateEmail(strEmail)) {
//        ShowToast.ShowToast(AlertMsg.Email_Invalid)
//    }
//    else if(isStringEmpty(password)) {
//        ShowToast.ShowToast(AlertMsg.Pass_Blank)
//    }
//    else if(isStringEmpty(strPassword)) {
//        ShowToast.ShowToast(AlertMsg.Pass_Blank)
//    }
//    else if(PasswordMinimumLenght > strPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Minimum)
//    }
//    else if(PasswordMaximumLenght < strPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Maximum)
//    }else if(isStringEmpty(strConfirmPassword)) {
//        ShowToast.ShowToast(AlertMsg.Pass_Blank)
//    }
//    else if(PasswordMinimumLenght > strConfirmPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Minimum)
//    }
//    else if(PasswordMaximumLenght < strConfirmPassword.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Pass_Length_Maximum)
//    }else if(strPassword != Confirpassword){
//        ShowToast.ShowToast(AlertMsg.Pass_not_Match_REGISTRATIO)
//    }
//    else {
//        return true
//    }
//
    return false
    
}

func loginValidation(_ email:String, password:String,  PasswordMinimumLenght:Int, PasswordMaximumLenght:Int) -> Bool {
    
    let strEmail = email.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strPassword = password.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    
    if (isStringEmpty(strEmail)) {
        ShowToast.ShowToast(AlertMsg.Email_Blank)
    }
//    else if(!validateEmail(strEmail as String)) {
//        ShowToast.ShowToast(AlertMsg.Email_Invalid)
//    }
    else if(isStringEmpty(strPassword)) {
        ShowToast.ShowToast(AlertMsg.Pass_Blank)
    }
    else if(PasswordMinimumLenght > strPassword.count) {
        ShowToast.ShowToast(AlertMsg.Pass_Length_Minimum)
    }
    else if(PasswordMaximumLenght < strPassword.count) {
        ShowToast.ShowToast(AlertMsg.Pass_Length_Maximum)
    }
    else {
        return true
    }

    return false
}
func addressValidation(_ name:String, house_No:String,  building_No:String, city:String, state:String) -> Bool {
    //note that house_No is House No/Office No textfield 
    let strName = name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strHouseNo = house_No.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strBuildingNo = house_No.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strcity = house_No.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strState = house_No.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    
//    if (isStringEmpty(strName)) {
//        ShowToast.ShowToast(AlertMsg.AddressName_Blank)
//    }else if (isStringEmpty(strHouseNo)) {
//        ShowToast.ShowToast(AlertMsg.AddressHouseNo_Blank)
//    }else if (isStringEmpty(strBuildingNo)) {
//        ShowToast.ShowToast(AlertMsg.AddressBuildingName_Blank)
//    }else if (isStringEmpty(strcity)) {
//        ShowToast.ShowToast(AlertMsg.AddressCity_Blank)
//    }else if (isStringEmpty(strState)) {
//        ShowToast.ShowToast(AlertMsg.AddressState_Blank)
//    }
//    else {
//        return true
//    }
//
    return false
}
func createServiceValidation(_ address:String, details:String, MaximumLenght:Int) -> Bool {
      let strAddress = address.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
     let strDetails = details.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
//    if (isStringEmpty(strAddress)) {
//        ShowToast.ShowToast(AlertMsg.Address_Blank)
//    }else if (isStringEmpty(strDetails)) {
//        ShowToast.ShowToast(AlertMsg.Details_Blank)
//    }else if (strDetails == "Details") {
//        ShowToast.ShowToast(AlertMsg.Details_Blank)
//    }else if(MaximumLenght < strDetails.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Limit)
//    }else{
//        return true
//    }

    return false
}

func reportValidation(_ reportType:String, name:String, emailAddress:String, number:String, details:String, MaximumLenght:Int) -> Bool{
    let strreportType = reportType.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strName = name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strEmailAddress = emailAddress.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strNumber = number.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let strDetails = details.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    
//     if(isStringEmpty(strreportType)) {
//        ShowToast.ShowToast(AlertMsg.ReportType)
//     }else if(isStringEmpty(strName)) {
//        ShowToast.ShowToast(AlertMsg.Name_Blank)
//    }else if (isStringEmpty(strEmailAddress)) {
//        ShowToast.ShowToast(AlertMsg.Email_Blank)
//    }else if(!validateEmail(strEmailAddress as String)) {
//        ShowToast.ShowToast(AlertMsg.Email_Invalid)
//     }else if(isStringEmpty(strNumber)) {
//        ShowToast.ShowToast(AlertMsg.Phone_Number)
//     }else if(isStringEmpty(strDetails)) {
//        ShowToast.ShowToast(AlertMsg.Details_Blank)
//    }else if(strDetails == "Write Your Message") {
//        ShowToast.ShowToast(AlertMsg.Details_Blank)
//    }else if(MaximumLenght < strDetails.characters.count) {
//        ShowToast.ShowToast(AlertMsg.Limit)
//    }else{
//        return true
//    }
    
    return false
    
}
func isValidPasswordAndConfirmPass(_ password:String, confirmPassword:String) -> Bool {
    
    if (password == confirmPassword) {
        return true
    }
    
    return false
    
}

func isPasswordLength(_ password:String) -> Bool {
    if(password.characters.count < 6) {
        return false
    }
    return true
}

func isStringEmpty(_ string:String) -> Bool {
    
    if string.characters.count == 0 {
        return true
    }
    else {
        return false
    }
}

func validateEmail(_ enteredEmail:String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
}

