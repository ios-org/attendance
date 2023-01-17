//
//  Landing1VC.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 8/7/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit

class Landing1VC: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewSecondry: UIView!
    @IBOutlet weak var lblText2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNextBtn()
    }
    
    func configureNextBtn(){
        btnNext.layer.cornerRadius = 21
        btnSkip.layer.cornerRadius = 21
        btnSkip.layer.borderWidth = 0.5
        btnSkip.layer.borderColor = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 0.6000000238)
        viewContainer.layer.cornerRadius = 72
        viewSecondry.layer.cornerRadius = 60
        
        viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
        viewContainer.layer.shadowOpacity = 0.3
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        viewContainer.layer.shadowRadius = 5
    }
    
    @IBAction func btnNextClicked(_ sender: Any) {
        
    }
    
    @IBAction func btnSkipClicked(_ sender: Any) {
        AppUserDefaults.setUserDefaultValue(value: true.description, key: Constants.skipLandingKey)
//        let storyBoard : UIStoryboard = UIStoryboard(name:  Constants.StoryBoardFile.Home, bundle:nil)
//        let homeVC  = storyBoard.instantiateViewController(withIdentifier: Constants.StoryBoardIdentifier.homeVC) as! HomeVC
//        present(homeVC, animated: true, completion: nil)
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
