//
//  Extensions.swift
//  weInternet
//
//  Created by Mohamed Shaikhon on 10/22/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit

class LightViewController: AuthNotifyVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension UIViewController {
    
    func instantiateVC<VC: UIViewController>(ofType: VC.Type, withIdentifier: String? = nil, storyboardIdentifier: String)->VC? {
        //assume the default VC identifier is the same as the VC class name unless specified otherwise
        let vcIdentifier = withIdentifier == nil ? String(describing: ofType) : withIdentifier!
        let storyBoard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: vcIdentifier) as? VC
    }

}
extension UIButton {
    func addBorder(radius: CGFloat = 18, borderColor: CGColor = UIColor.lightGray.cgColor, borderWidth: CGFloat = 1 ) {
        layer.borderColor = borderColor
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
    }
    func addShadow(shadowOffset: CGFloat = 0.0,
                   shadowColor: CGColor = UIColor.gray.cgColor,
                   radius: CGFloat = 5,
                   opacity: CGFloat = 0.15) {
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.15
    }
    
}

class LeftPaddedUILabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 5, left: 40, bottom: 5, right: 22)
        super.drawText(in: rect.inset(by: insets))
    }
    
}
class LeftPaddedUITextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 22)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
extension UIView{
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds

       layer.insertSublayer(gradientLayer, at: 0)
    }
}
extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
