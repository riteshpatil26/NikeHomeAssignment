//
//  ActivityIndicator.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class ActivityIndicator: NSObject {

    let activityView = UIActivityIndicatorView(style: .whiteLarge)
    let container: UIView = UIView()
    func showActivityIndicatory(view:UIView,width:CGFloat,height : CGFloat) {
        
        container.frame = CGRect(x: 0, y: 0, width: width, height: height) // Set X and Y whatever you want
        container.backgroundColor = .clear
        
        activityView.color = kMAIN_THEME_COLOR
        activityView.center = view.center
        
        container.addSubview(activityView)
        view.addSubview(container)
        activityView.startAnimating()
    }
    
    func hideActivityIndicator(){
        container.removeFromSuperview()
        activityView.hidesWhenStopped = true
    }
    
}
