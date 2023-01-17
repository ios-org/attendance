//
//  ViewController.swift
//  we Internet
//
//  Created by ahmed.fouadgomaa on 3/26/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit
import WebKit

class LoginVC: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var btnNavigate: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet internal weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var presenter: LoginVCPresenter!
    var webView : WKWebView!
    var label: UILabel!
    
    @IBAction func btnClicked(_ sender: Any) {
//        self.performSegue(withIdentifier: "Test", sender: self)
        
        print(CustomerInfo.sharedInstance.customerNumber)
        
//        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: "HomeVC")
//        self.present(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        title = "hello"
        
//        presenter = LoginVCPresenter(view: self)
    }

    @IBAction func btnLoginClicked(_ sender: Any) {
        guard let email = txtUsername.text, let password = txtPassword.text else {
            return
        }
        
        CustomerInfo.sharedInstance.emailAddress = email
        CustomerInfo.sharedInstance.password = password
        
//        presenter.loginFunc(username: "",password: "")
    }
}

extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
