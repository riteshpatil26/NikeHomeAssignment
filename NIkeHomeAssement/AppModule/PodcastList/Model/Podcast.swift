//
//  Podcast'.swift
//  NIkeHomeAssement
//
//  Created by Ritesh Patil on 2/10/20.
//  Copyright © 2020 Ritesh Patil. All rights reserved.
//

import UIKit

class Podcast: NSObject {

    var artistName:String?
    var id:String?
    var releaseDate :String?
    var name : String?
    var kind:String?
    var copyright:String?
    var artistUrl :String?
    var artworkUrl_100 : String?
    var url:String?
    
    init(obj : Podcast){
        self.id = obj.id
        self.name = obj.name
        self.artistName = obj.artistName
        self.releaseDate = obj.releaseDate
        self.kind = obj.kind
        self.copyright = obj.copyright
        self.artistUrl = obj.artistUrl
        self.artworkUrl_100 = obj.artworkUrl_100
        self.url = obj.url
    }
    override init(){
        self.id = "1496639180"
        self.name = "Changes"
        self.artistName = "Justin Bieber"
        self.releaseDate = "2020-02-14"
        self.kind = "album"
        self.copyright = "℗ 2020 Def Jam Recordings, a division of UMG Recordings, Inc."
        self.artistUrl = "https://music.apple.com/us/artist/justin-bieber/320569549?app=music"
        self.artworkUrl_100 = "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/49/c1/04/49c10497-421b-5480-0e88-2b1b9c7b038c/20UMGIM03126.rgb.jpg/200x200bb.png"

        self.url = "https://music.apple.com/us/album/changes/1496639180?app=music"
    }
    init(dictData:Dictionary<String,AnyObject>){
        if let top = dictData["id"] {
            self.id = top as? String
        }
        if let top = dictData["name"] {
            self.name = top as? String
        }
        if let top = dictData["artistName"]{
            self.artistName = top as? String
        }
        if let top = dictData["releaseDate"]{
            self.releaseDate = top as? String
        }
        if let top = dictData["kind"]{
            self.kind = top as? String
        }
        if let top = dictData["copyright"]{
            self.copyright = top as? String
        }
        if let top = dictData["artistUrl"]{
            self.artistUrl = top as? String
        }
        if let top = dictData["artworkUrl100"]{
            self.artworkUrl_100 = top as? String
        }
    }
    
}
