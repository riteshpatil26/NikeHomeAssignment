//
//  Genr.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/13/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class Genr: NSObject {
    var generId:String?
    var name:String?
    var url :String?
    
    init(obj : Genr){
        self.generId = obj.generId
        self.name = obj.name
        self.url = obj.url
    }
    override init(){
        self.generId = "1496639180"
        self.name = "Changes"
        self.url = "https://music.apple.com/us/album/changes/1496639180?app=music"
    }
    init(dictData:Dictionary<String,AnyObject>){
        if let top = dictData["genreId"] {
            self.generId = top as? String
        }
        if let top = dictData["name"] {
            self.name = top as? String
        }
        if let top = dictData["url"]{
            self.url = top as? String
        }
    }
}
