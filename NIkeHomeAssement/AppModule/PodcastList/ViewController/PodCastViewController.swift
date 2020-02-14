//
//  PodCastViewController.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/9/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit
protocol DetailPodcastViewControllerInfoDelegate {
    func transferInfo(selectedIndex :Int,podcast :Array<Podcast>,Image:UIImage)
}

class PodCastViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var podCastListtableView: UITableView = UITableView()
    var podCastArray: Array<Podcast> = Array<Podcast>()
    var activityIndicatorView: ActivityIndicator = ActivityIndicator()
    public let refreshControl = UIRefreshControl()
    var delegate:DetailPodcastViewControllerInfoDelegate?
    var vc = DetailPodCastViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ALBUMS"
        addTableView()
        activityIndicatorView.showActivityIndicatory(view: self.view, width: 80, height: 80)
        /* Added Pull to refresh Code */
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.black
        if #available(iOS 10.0, *) {
            podCastListtableView.refreshControl = refreshControl
        } else {
            podCastListtableView.addSubview(refreshControl)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.getPodcastApi()
        }
    }
    
    public func addTableView(){
        self.view.addSubview(self.podCastListtableView)
        self.podCastListtableView.alpha = 0
        self.podCastListtableView.separatorColor = UIColor(white: 1, alpha: 0.2)
        self.podCastListtableView.translatesAutoresizingMaskIntoConstraints = false
        self.podCastListtableView.backgroundColor = UIColor.white
        podCastListtableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (UIApplication.shared.statusBarFrame.height) + ((self.navigationController?.navigationBar.frame.height)!)).isActive = true
        podCastListtableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        podCastListtableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        podCastListtableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.podCastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PodaCastTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "podcastCell")
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.contentView.backgroundColor = UIColor.clear
        cell.mainView.backgroundColor = UIColor.black.withAlphaComponent(0.9);
        cell.artistLabel.text = podCastArray[indexPath.row].artistName
        cell.albumName.text = podCastArray[indexPath.row].name
        cell.albumImage.contentMode = .scaleAspectFill
        cell.albumImage.clipsToBounds = true
        
        if let checkedUrl = URL(string: "\(podCastArray[indexPath.row].artworkUrl_100!)"){
            ImageService.getImage(withURL: checkedUrl) { image in
                if(image == nil){
                    cell.albumImage.image = UIImage(named: "podcast")
                }else{
                    cell.albumImage.image = image
                }
            }
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath) as? PodaCastTableViewCell
        self.delegate = vc
        self.delegate?.transferInfo(selectedIndex: indexPath.row, podcast: podCastArray, Image: (cell?.albumImage.image)!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    public func getPodcastApi(){
        if Network.iSConnectedToNetwork(){
            self.getPodcastList()
        }else{
            self.showSimpleAlert(message: "No Internet Connection")
        }
    }
    /* This Methods Calls when Pull to Refresh of TableView */
    @objc private func refreshData(_ sender: Any) {
        getPodcastApi()
    }
}
