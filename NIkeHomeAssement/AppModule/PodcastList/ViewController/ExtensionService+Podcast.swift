//
//  ExtensionService+Podcast.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
import UIKit
extension PodCastViewController{
    func getPodcastList() {
        let APIUrl = NSURL(string:"\(BASE_URL)")
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.sessionSendsLaunchEvents = true
        sessionConfig.isDiscretionary = true
        sessionConfig.timeoutIntervalForResource = 20.0
        let defaultSession = URLSession(configuration: sessionConfig)
        let task = defaultSession.dataTask(with: APIUrl! as URL) { (data, response, error) in
            if data == nil {
                self.activityIndicatorView.hideActivityIndicator()
                self.refreshControl.endRefreshing()
                self.showSimpleAlert(message: "\(error?.localizedDescription)")
                
                return
            }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data!, options: []) as AnyObject
                let arraylist = (jsonResponse["feed"]as! Dictionary<String,Any>)["results"] as! Array<Dictionary<String,Any>>
                self.podCastArray.removeAll()
                for itmet in arraylist{
                    self.podCastArray.append(Podcast(dictData: itmet as Dictionary<String, AnyObject>))
                }
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.podCastListtableView.dataSource = self
                        self.podCastListtableView.delegate = self
                        self.podCastListtableView.reloadData()
                        self.podCastListtableView.alpha = 1
                        self.activityIndicatorView.hideActivityIndicator()
                        self.refreshControl.endRefreshing()
                    }
                }
            } catch let parsingError {
                self.refreshControl.endRefreshing()
                self.showSimpleAlert(message: "\(parsingError)")
            }
        }
        task.taskDescription = "RssFeedList"
        task.resume()
    }
    
    
    func showSimpleAlert(message:String) {
        let alert = UIAlertController(title: kAPP_NAME, message: "\(message)",preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Retry",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        self.getPodcastApi()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


