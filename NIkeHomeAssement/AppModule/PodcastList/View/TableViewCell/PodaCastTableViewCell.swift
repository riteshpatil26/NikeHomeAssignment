//
//  PodaCastTableViewCell.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/9/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class PodaCastTableViewCell: UITableViewCell {
    
    /* Initialisation of View  */
    var mainView :UIView = UIView()
    var albumImage: UIImageView = UIImageView()
    var stackView: UIView = UIView()
    var albumName: UILabel = UILabel()
    var artistLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
    }
    func addContentView(){
        self.addSubview(mainView)
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        self.mainView.backgroundColor = UIColor.white
        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        
        /* Add ImageView */
        self.mainView.addSubview(self.albumImage)
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 70).isActive = true
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 70).isActive = true
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -5).isActive = true
        NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 5).isActive = true
        
        
        /* Add StackView */
        self.mainView.addSubview(self.stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10).isActive = true
        
        NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: albumImage, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -10).isActive = true
        
        NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: mainView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10).isActive = true
        
        /* Add AlbumName */
        
        self.stackView.addSubview(self.albumName)
        albumName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: albumName, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: albumName, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: albumName, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0).isActive = true
        self.albumName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        /* Add artistLabel */
        self.stackView.addSubview(self.artistLabel)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: artistLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: albumName, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10).isActive = true
        
        NSLayoutConstraint(item: artistLabel, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: artistLabel, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: artistLabel, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: stackView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true
        self.albumImage.image = UIImage(named: "podcast")
        self.artistLabel.text = "N/A"
        self.albumName.text = "--"
        self.albumName.font = ResManager.Font.bold(16)
        self.albumName.textColor = UIColor.white
        self.albumName.adjustFontSize = true
        self.albumName.minimumScaleFactor = 0.7
        self.artistLabel.font = ResManager.Font.thin(12)
        self.artistLabel.textColor = UIColor.lightGray
        self.artistLabel.adjustFontSize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
