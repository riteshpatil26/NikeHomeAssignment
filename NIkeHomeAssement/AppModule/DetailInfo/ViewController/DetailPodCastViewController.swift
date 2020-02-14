//
//  DetailPodCastViewController.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/11/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class DetailPodCastViewController: UIViewController ,DetailPodcastViewControllerInfoDelegate{
    var detailView: DetailView!
    var podcastArray:Array<Podcast>?
    var image: UIImage?
    var tempstrings:[String] = []
    var albumGene :Dictionary<String,AnyObject> = Dictionary<String,AnyObject>()
    var albumArray:Array<String> = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
       // Do any additional setup after loading the view.
        addBackButton()
      }
    func transferInfo(selectedIndex: Int, podcast: Array<Podcast>, Image: UIImage) {
        var temp :String = String()
        podcastArray = podcast
        self.detailView = DetailView(frame: self.view.frame)
        self.view.addSubview(self.detailView)
        self.title = podcastArray?[selectedIndex].name
        self.detailView.imageView.image = Image
        self.detailView.backgroundColor = self.detailView.imageView.image?.averageColor
        self.tempstrings.removeAll()
        self.tempstrings.append("ArtistName : \(String(describing: podcastArray![selectedIndex].artistName!))")
        self.tempstrings.append("")
        self.tempstrings.append("CopyRight : \(String(describing: podcastArray![selectedIndex].copyright!))")
        self.tempstrings.append("")
        self.tempstrings.append("Release Date : \(String(describing: podcastArray![selectedIndex].releaseDate!))")
        albumArray.removeAll()
        if podcastArray![0].genre.count == 0{
            temp = "N/A"
        }else{
            for item in (podcastArray?[selectedIndex].genre)!{
                albumGene = item as! Dictionary<String, AnyObject>
                albumArray.append(albumGene["name"]! as! String)
            }
        }
        let joined = self.albumArray.joined(separator: ",")
        if joined == ""{
            temp = "N/A"
        }else{
            temp = joined
        }
        self.tempstrings.append("")
        self.tempstrings.append("Genre :\(temp)")
        ResManager.attributedString(tempstrings: tempstrings, textView: self.detailView.textView)
        self.detailView.textView.font = ResManager.Font.thin(16)
        self.detailView.textView.adjustFontSize = true

    }
    
    public func addBackButton(){
        let newBackButton = UIBarButtonItem(image: UIImage(named: "Back")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    @objc func back(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }

}
