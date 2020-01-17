//
//  NEWS.swift
//  poslty
//
//  Created by Moustafa on 12/24/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import Foundation
import RealmSwift





struct Newsinfo:Decodable
{
    var id:String?
    var post_title:String?
    var post_content:String?
}



@objcMembers class NewsRealm:Object
{
    dynamic var id:String?=""
    dynamic var post_title:String?=""
    dynamic var  post_content:String?=""
    convenience init(id:String,post_title:String,post_content:String)
    {
        self.init()
        self.id=id
        self.post_title=post_title
        self.post_content=post_content
    }
    
    
    dynamic var nId = UUID().uuidString
    override static func primaryKey() -> String? {
      return "id"
    }
}


//struct countryInfo:Decodable {
//     var name:String?
//     var capital:String?
//     var region:String?
//     var cioc:String?
//}
//
//
//@objcMembers class countryRalm:Object {
//
//    dynamic var name:String?=""
//    dynamic var capital:String?=""
//    dynamic var region:String?=""
//    dynamic var cioc:String?=""
//
//    convenience init(name:String,capital:String,region:String,cioc:String) {
//        self.init()
//        self.name=name
//        self.capital=capital
//        self.cioc=cioc
//        self.region=region
//    }
//    dynamic var countruId = UUID().uuidString
//    override static func primaryKey() -> String? {
//      return "countruId"
//    }
//
//
//}



