//  
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved//
//

import UIKit

var SCREEN_WIDTH  = UIScreen.main.bounds.width
var SCREEN_HEIGHT  = UIScreen.main.bounds.height
var SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)

var IS_IPHONE_5 = (SCREEN_MAX_LENGTH == 568.0) ? true : false
var IS_IPHONE_6 =  (SCREEN_MAX_LENGTH == 667.0) ? true : false
var IS_IPHONE_6P =  (SCREEN_MAX_LENGTH == 736.0) ? true : false
var IS_IPHONEXR =  (SCREEN_MAX_LENGTH == 896) ? true : false
var IS_IPHONEXS =  (SCREEN_MAX_LENGTH == 812) ? true : false

///*************************** Extension for viewController *********************************

// MARK: Adjust UILabel font size according to device screen size Extention
extension UILabel {
    /// This method set Font size according to phone model
    
    var adjustFontSize: Bool{
        set {
            if newValue {
                let currentFont = self.font
                var sizeScale: CGFloat = 1
                if IS_IPHONE_5 {
                    sizeScale = 0.8
                }else if IS_IPHONE_6 {
                    sizeScale = 1.0
                }else if IS_IPHONE_6P {
                    sizeScale = 1.1
                }else if IS_IPHONEXR{
                    sizeScale = 1.10
                }else if IS_IPHONEXS{
                    sizeScale = 1.1
                }else{
                    sizeScale = 1.2
                }
                
                self.font = currentFont?.withSize((currentFont?.pointSize)! * sizeScale)
            }   }
        
        get {
            return false
        }
    }
    
    
    
}
extension UITextView {
    var adjustFontSize: Bool{
        set {
            if newValue {
                let currentFont = self.font
                var sizeScale: CGFloat = 1
                if IS_IPHONE_5 {
                    sizeScale = 0.8
                }else if IS_IPHONE_6 {
                    sizeScale = 1.0
                }else if IS_IPHONE_6P {
                    sizeScale = 1.1
                }else if IS_IPHONEXR{
                    sizeScale = 1.10
                }else if IS_IPHONEXS{
                    sizeScale = 1.1
                }else{
                    sizeScale = 1.2
                }
                
                self.font = currentFont?.withSize((currentFont?.pointSize)! * sizeScale)
            }   }
        
        get {
            return false
        }
    }
    
    
    
}
extension UIImage {
    var averageColor: UIColor? {
        guard let inputImage = CIImage(image: self) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull!])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        
        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
extension UIButton {
    var adjustFontSize: Bool{
        set {
            if newValue {
                let currentFont = self.titleLabel?.font
                var sizeScale: CGFloat = 1
                if IS_IPHONE_5 {
                    sizeScale = 0.8
                }else if IS_IPHONE_6 {
                    sizeScale = 1.0
                }else if IS_IPHONE_6P {
                    sizeScale = 1.1
                }else if IS_IPHONEXR{
                    sizeScale = 1.10
                }else if IS_IPHONEXS{
                    sizeScale = 1.1
                }else{
                    sizeScale = 1.2
                }
                self.titleLabel!.font = (currentFont?.withSize((currentFont?.pointSize)! * sizeScale))!
            }   }
        
        get {
            return false
        }
    }
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = true
        super.touchesBegan(touches, with: event)
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isHighlighted = false
        super.touchesEnded(touches, with: event)
    }
    override open func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        self.isHighlighted = false
        super.touchesCancelled(touches!, with: event)
    }
    
    
}







