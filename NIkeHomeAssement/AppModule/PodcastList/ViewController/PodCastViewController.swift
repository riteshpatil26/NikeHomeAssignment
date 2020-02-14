//
//  PodCastViewController.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/9/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class PodCastViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var podCastListtableView: UITableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      addTableView()
        // Do any additional setup after loading the view.
    }
    public func addTableView(){
        self.view.addSubview(self.podCastListtableView)
        self.podCastListtableView.delegate = self
        self.podCastListtableView.dataSource = self
        self.podCastListtableView.translatesAutoresizingMaskIntoConstraints = false
        self.podCastListtableView.backgroundColor = UIColor.white
        podCastListtableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 87).isActive = true
        podCastListtableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        podCastListtableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        podCastListtableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PodaCastTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "podcastCell")
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}
