//
//  Login2VC.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 8/8/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit
import Keys

class Login2VC: LightViewController {
    
    let service = "myService"
    let account = "myAccount"
    
    @IBOutlet weak var txtUsername: UITextField!
        //{
        //didSet {
//            let imageView = UIImageView()
//
//            imageView.contentMode = .scaleAspectFit
//            let image = UIImage(named: "LoginUsernameImg")
//            imageView.image = image
//
//            txtUsername.leftView = imageView
//            txtUsername.leftViewMode = .always
//        }
    //}
    @IBOutlet weak var txtPassword: UITextField!
        //{
        //didSet {
//            let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 12.0))
//            imageView.contentMode = .scaleAspectFit
//            let image = UIImage(named: "LoginPasswordImg")
//            imageView.image = image
//            txtPassword.leftView = imageView
//            txtPassword.leftViewMode = .always
        //}
    //}
    @IBOutlet weak var btnLogin: UIButton! {
        didSet{
            btnLogin.layer.cornerRadius = 6
//            btnLogin.layer.borderWidth = 0.5
            //btnLogin.layer.borderColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.6000000238)
        }
    }
    @IBOutlet weak var btnSkip: UIButton!
//        {
//        didSet{
//            btnSkip.layer.cornerRadius = 21
//            btnSkip.layer.borderWidth = 0.5
//            btnSkip.layer.borderColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.6000000238)
//            //            btnSkip.layer.borderColor = UIColor.init(named: "SkipColor")?.cgColor
//        }
//    }
    
    let yourAttributes : [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font : UIFont(name:"Droid Arabic Kufi",size:17)!,
        NSAttributedString.Key.foregroundColor : UIColor(red: 150/255.0, green: 33/255.0, blue: 114/255.0, alpha: 1.0) ,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
       //.styleDouble.rawValue, .styleThick.rawValue, .styleNone.rawValue
    
    var presenter: LoginVCPresenter!
    @IBOutlet weak var lbltest: UILabel!
    @IBOutlet var loginScrollView: UIScrollView! {
        didSet{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        KeychainService.removePassword(service: Constants.service1, account: Constants.account)
        KeychainService.removePassword(service: Constants.service2, account: Constants.account)
        KeychainService.removePassword(service: Constants.service3, account: Constants.account)
        //txtUsername.placeholder = LanguageManager.sharedInstance.getTranslationForKey("header_text", value: "")
        txtPassword.delegate = self
        txtUsername.delegate = self
        presenter = LoginVCPresenter(view1: self, view2: self)
        
        //        loginScrollView.contentSize = CGSize(width: 375, height: self.view.frame.height)
        loginScrollView.frame.origin.y = view.frame.origin.y
        loginScrollView.isScrollEnabled = false
        
        print(AppUserDefaults.getUserDefaultValueForKey(key: Constants.skipLandingKey))
        
        setKeyboardNotifications()
        hideKeyboardWhenTappedAround()
        
        adjustSkipButton()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtUsername.delegate = self
        txtPassword.delegate = self
    }
    func adjustSkipButton(){
        let attributeString = NSMutableAttributedString(string: "الشبكة الطبية للأسر والمعاشات",
                                                        attributes: yourAttributes)
        btnSkip.setAttributedTitle(attributeString, for: .normal)
    }
    func resignResponders(){
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
        btnLogin.resignFirstResponder()
        loginScrollView.isScrollEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtUsername?.setLocalized()
        txtPassword?.setLocalized()
        
        //        if(LanguageManager.sharedInstance.getCurrentLanuage() == "en"){
        //            LanguageManager.sharedInstance.setLanuageAs(lan: "ar")
        //            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        //        }else{
        //            LanguageManager.sharedInstance.setLanuageAs(lan: "en")
        //            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        //        }
    }
    
    func setKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIWindow.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name: UIWindow.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboard(notification: Notification) {
        loginScrollView.isScrollEnabled = true
        let userInfo = notification.userInfo
        let keyBoardScreenEndFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        if notification.name == UIWindow.keyboardWillHideNotification{
            loginScrollView.contentInset = UIEdgeInsets.zero
            loginScrollView.isScrollEnabled = false
            
            
        }else{
            loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ((keyBoardScreenEndFrame?.height)!-150), right: 0)
        }
        loginScrollView.scrollIndicatorInsets = loginScrollView.contentInset
    }
    
    
    @IBAction func btnSkipClicked(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Landing, bundle:nil)
//        let dashBoardVC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.dashBoardVC) as! DashBoardVC
//        self.navigationController?.pushViewController(dashBoardVC, animated: true)
        
        //        if let str = KeychainService.loadPassword(service: Constants.service, account: Constants.account) {
        //            print(str)
        //        }
        //        else {
        //            print("Password does not exist")
        //        }
        
        
        Constants.medNetworkNo = 2
        AppUserDefaults.setUserDefaultValue(value: "2", key: "medNetworkNo")
        let keys = WECareKeys()
        presenter.userLogin(username: keys.retireesUsername, password: keys.retireesPassword)
        resignResponders()

        
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        
        var username = txtUsername.text
        username = username?.replacingOccurrences(of: "@te.eg", with: "")
        AppUserDefaults.setUserDefaultValue(value: "1", key: "medNetworkNo")
        presenter.userLogin(username: username ?? "", password: txtPassword.text!)
        resignResponders()

        
        //
        //        let password = txtPassword.text
        //        KeychainService.savePassword(service: service, account: account, data: password!)
        //        print("Password Saved")
    }
    
    @IBAction func btnChangeLanguageClicked(_ sender: Any) {
        //        if(LanguageManager.sharedInstance.getCurrentLanuage() == "en"){
        //            LanguageManager.sharedInstance.setLanuageAs(lan: "ar")
        //            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        //        }else{
        //            LanguageManager.sharedInstance.setLanuageAs(lan: "en")
        //            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        //        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login2VC") as! Login2VC
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        
        appDlg?.window?.rootViewController = vc
        
        //        viewDidLoad()
        //        viewWillAppear(true)
    }
}

extension UITextField{
    
    func setLocalized() -> Void {
        if LanguageManager.sharedInstance.getCurrentLanuage() == "ar"{// check RTL or LTR here {
            self.textAlignment = .right
            self.semanticContentAttribute = .forceRightToLeft
        }
        else{
            self.textAlignment = .left
            self.semanticContentAttribute = .forceLeftToRight
        }
    }
    
}

//make return button hide keyboard
extension Login2VC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 150/255.0, green: 33/255.0, blue: 114/255.0, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor 
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
