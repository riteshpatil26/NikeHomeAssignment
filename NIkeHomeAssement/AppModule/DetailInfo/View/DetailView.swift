//
//  DetailView.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/11/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit
/* Delegate created to navigate to itunes store to particular URL */
protocol NavigateToitunes{
    func navigateItunes()
}
/*  View class whose object is created in DetailPodCastConttoller */
class DetailView: UIView {
    //#MARK:View Intialisation
    var btnToItunes : UIButton = UIButton()
    var imageViewSuperView: UIView = UIView()
    var imageView: UIImageView = UIImageView()
    var textView : UITextView = UITextView()
    var delegate : NavigateToitunes?
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    //#MARK: Initialisation of view and AutoLayout
    func addView(){
        /* Creation of Button */
        self.addSubview(btnToItunes)
        self.btnToItunes.translatesAutoresizingMaskIntoConstraints = false
        btnToItunes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-20).isActive = true
        btnToItunes.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        btnToItunes.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        btnToItunes.addTarget(self, action: #selector(navigateToItunes), for: .touchUpInside)
        btnToItunes.layer.borderWidth = 1
        btnToItunes.layer.borderColor = UIColor.white.cgColor
        NSLayoutConstraint(item: btnToItunes, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0.8, constant: 45).isActive = true
        self.btnToItunes.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        self.btnToItunes.titleLabel?.textColor = UIColor.white
        self.btnToItunes.setTitle("ITUNES CONNECT", for: .normal)
        
        self.addSubview(imageViewSuperView)
        self.imageViewSuperView.translatesAutoresizingMaskIntoConstraints = false
        if IS_IPHONE_5 || IS_IPHONE_6{
            imageViewSuperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        }else{
            imageViewSuperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 97).isActive = true
        }
        imageViewSuperView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        imageViewSuperView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        NSLayoutConstraint(item: imageViewSuperView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.height, multiplier: self.imageViewSuperView.frame.height / self.frame.height , constant: 350).isActive = true
        /* ImageView */
        self.addSubview(imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: imageViewSuperView.topAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: imageViewSuperView.rightAnchor, constant: -10).isActive = true
        imageView.leftAnchor.constraint(equalTo: imageViewSuperView.leftAnchor, constant: 10).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageViewSuperView.bottomAnchor, constant: -10).isActive = true
        self.imageView.image = UIImage(named: "podcast")
        /*TextView */
        self.addSubview(textView)
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: imageViewSuperView.bottomAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:-10).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        textView.bottomAnchor.constraint(equalTo: btnToItunes.topAnchor, constant: -10).isActive = true
        textView.isEditable = false
        textView.isSelectable  = false
        textView.showsVerticalScrollIndicator = true
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
    }
    @objc func navigateToItunes(sender: UIButton!) {
        self.delegate?.navigateItunes()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

