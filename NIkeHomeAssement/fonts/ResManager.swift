//
//  ResManager.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved
//
import Foundation
import UIKit

class ResManager {
   struct Font {
        static let bold = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_bold_3", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static let medium = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_medium_4", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static let semibold = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_semibold", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static let text = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_text", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static let thin = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_thin", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        static let ultralight = { (size: CGFloat) in
            UIFont(name: "myriad-set-pro_ultralight", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
    }
    
    static func createParagraphAttribute() ->NSParagraphStyle{
        var paragraphStyle: NSMutableParagraphStyle
        paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.defaultTabInterval = 15
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.headIndent = 15
        return paragraphStyle
    }
    
    static func attributedString(tempstrings :Array<String>,textView :UITextView){
        let fullAttributedString = NSMutableAttributedString(string: "", attributes:nil)
        for string: String in (tempstrings){
            let formattedString: String = "\(string)\n"
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: formattedString)
            let paragraphStyle = createParagraphAttribute()
            attributedString.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attributedString.length))
            fullAttributedString.append(attributedString)
        }
        textView.attributedText = fullAttributedString
        
    }

}

