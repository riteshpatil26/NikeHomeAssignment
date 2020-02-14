//
//  ExtensionService+Podcast.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import Foundation
extension PodCastViewController{
    func getCountryLists() {
        let APIUrl = NSURL(string:"\(BASE_URL)")
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.sessionSendsLaunchEvents = true
        sessionConfig.isDiscretionary = true
        sessionConfig.timeoutIntervalForResource = 20.0
        let defaultSession = URLSession(configuration: sessionConfig)
        let task = defaultSession.dataTask(with: APIUrl! as URL) { (data, response, error) in
            if data == nil {
                print("dataTaskWithRequest error: \(String(describing: error?.localizedDescription))")
               self.activityIndicatorView.hideActivityIndicator()
               //AlertView.instance.showAlert(title: "Failure", message: "\(error?.localizedDescription)", alertType: .failure)
                return
            }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    data!, options: []) as AnyObject
               let arraylist = (jsonResponse["feed"]as! Dictionary<String,Any>)["results"] as! Array<Dictionary<String,Any>>
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
                       // self.refreshControl.endRefreshing()
                    }
                }
            } catch let parsingError {
                //AlertView.instance.showAlert(title: "Failure", message: "\(parsingError)", alertType: .failure)
                print("Error", parsingError)
            }
        }
        task.taskDescription = "RssFeedList"
        task.resume()
    }
}
