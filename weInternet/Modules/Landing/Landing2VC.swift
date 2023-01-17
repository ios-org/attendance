//
//  Landing2VC.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 8/8/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit

class Landing2VC: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewSecondry: UIView!
    @IBOutlet weak var lblText2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStartBtn()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func configureStartBtn(){
        btnStart.layer.cornerRadius = 21
        viewContainer.layer.cornerRadius = 72
        viewSecondry.layer.cornerRadius = 60
        
        viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
        viewContainer.layer.shadowOpacity = 0.3
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        viewContainer.layer.shadowRadius = 5
        
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        AppUserDefaults.setUserDefaultValue(value: true.description, key: Constants.skipLandingKey)

       // performSegue(withIdentifier: "login2VC", sender: nil)
        
//        let viewtoView = Login2VC()
//        let transition: CATransition = CATransition()
//        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.duration = 0.3
//        transition.timingFunction = timeFunc
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        
//        self.view.window?.layer.add(transition, forKey: nil)
//        self.present(viewtoView, animated: false, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
