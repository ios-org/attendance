//
//  String_Extension.swift
//  Jogo
//
//  Created by Ahmad Fouad on 19/04/17.
//  Copyright © 2017 openxcell. All rights reserved.
//

import Foundation
import UIKit
extension String {
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
    
    func localized() -> String {

        var strLanguage:String
        strLanguage = AppUserDefaults.getUserDefaultValueForKey(key: "Language")

        let path:String?
        if strLanguage == "ar" {
            path = Bundle.main.path(forResource: "ar", ofType: "lproj")
        } else {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")
        }
        
        let bundle = Bundle(path: path!)
        if let string = bundle?.localizedString(forKey: self, value: self, table: nil)
        {
            return string
        }
        else {
            return self
        }
    }
    
    func localizedLanguage(lang:String) ->String {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
    
    func removingAllWhitespaces() -> String {
        return removingCharacters(from: .whitespaces)
    }
    func removingCharacters(from set: CharacterSet) -> String {
        var newString = self
        newString.removeAll { char -> Bool in
            guard let scalar = char.unicodeScalars.first else { return false }
            return set.contains(scalar)
        }
        return newString
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}

extension UILabel {

     func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = text as NSString
        
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(labelSize.width)
    }
    
    func fitTextToBounds() {
        guard let text = text, let currentFont = font else { return }
        
        let bestFittingFont = UIFont.bestFittingFont(for: text, in: bounds, fontDescriptor: currentFont.fontDescriptor, additionalAttributes: basicStringAttributes)
        font = bestFittingFont
    }
    
    private var basicStringAttributes: [NSAttributedString.Key: Any] {
        var attribs = [NSAttributedString.Key: Any]()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.lineBreakMode = self.lineBreakMode
        attribs[.paragraphStyle] = paragraphStyle
        
        return attribs
    }
    
    
    func getFontFamilyAndSize(fontSize:CGFloat) -> UIFont{
        let currentFontName = self.font.fontName
        var calculatedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        switch height {
        case 568.0: //iphone  5s
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.8)
            self.font = calculatedFont
            return calculatedFont!
            break
        case 667.0: //iphone 6,7,8
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.9)
            self.font = calculatedFont
            return calculatedFont!
            
            break
        case 736.0,812.0,896.0: //iphone 8Plus , XS , XSMax
            calculatedFont = UIFont(name: currentFontName, size: fontSize)
            self.font = calculatedFont
            return calculatedFont!
            
            break
        default:
            calculatedFont = UIFont(name: currentFontName, size: fontSize)
            self.font = calculatedFont
            return calculatedFont!
            
            break
        }
        
    }
    
    
}
extension UIFont {
    
    /**
     Will return the best font conforming to the descriptor which will fit in the provided bounds.
     */
    static func bestFittingFontSize(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor, additionalAttributes: [NSAttributedString.Key: Any]? = nil) -> CGFloat {
        let constrainingDimension = min(bounds.width, bounds.height)
        let properBounds = CGRect(origin: .zero, size: bounds.size)
        var attributes = additionalAttributes ?? [:]
        
        let infiniteBounds = CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
        var bestFontSize: CGFloat = constrainingDimension
        
        for fontSize in stride(from: bestFontSize, through: 0, by: -1) {
            let newFont = UIFont(descriptor: fontDescriptor, size: fontSize)
            attributes[.font] = newFont
            
            let currentFrame = text.boundingRect(with: infiniteBounds, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
            
            if properBounds.contains(currentFrame) {
                bestFontSize = fontSize
                break
            }
        }
        return bestFontSize
    }
    
    static func bestFittingFont(for text: String, in bounds: CGRect, fontDescriptor: UIFontDescriptor, additionalAttributes: [NSAttributedString.Key: Any]? = nil) -> UIFont {
        let bestSize = bestFittingFontSize(for: text, in: bounds, fontDescriptor: fontDescriptor, additionalAttributes: additionalAttributes)
        return UIFont(descriptor: fontDescriptor, size: bestSize)
    }
}
class UILabelDeviceClass : UILabel {
    
    @IBInspectable var iPhoneFontSize:CGFloat = 0 {
        didSet {
            overrideFontSize(fontSize: iPhoneFontSize)
        }
    }

    func overrideFontSize(fontSize:CGFloat){
        let currentFontName = self.font.fontName
        var calculatedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let height = bounds.size.height
        switch height {
        case 568.0: //iphone  5s
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.8)
            self.font = calculatedFont
            break
        case 667.0: //iphone 6,7,8
            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.9)
            self.font = calculatedFont
            break
        case 736.0,812.0,896.0: //iphone 8Plus , XS , XSMax
            calculatedFont = UIFont(name: currentFontName, size: fontSize)
            self.font = calculatedFont
            break
        default:
            calculatedFont = UIFont(name: currentFontName, size: fontSize)
            self.font = calculatedFont
            break
        }
        
    }
}

//below class is to diable copy/paste function at LoginVC username and password UITextFields
class CustomUITextField: UITextField {
    let textPadding = UIEdgeInsets(top: 0, left: 37, bottom: 0, right: 37)
//    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
//        return CGSize(width: 40, height: 12)
//    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
     }
     override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: textPadding)
        }
//    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: bounds.width - 80, y: bounds.height / 2, width: bounds.height / 2 , height: bounds.height / 2)
//    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: bounds.midY - bounds.height / 6 , width: bounds.height / 3 , height: bounds.height / 3)
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
func estimatedLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
     
     let size = CGSize(width: width, height: 1000)
     
     let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
     
     let attributes = [NSAttributedString.Key.font: font]
     
     let rectangleHeight = String(text).boundingRect(with: size, options: options, attributes: attributes, context: nil).height
     
     return rectangleHeight
 }
