//
//  category.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import Foundation
import RealmSwift
//struct Category {
//    private(set)public var titlename:String
//    private(set)public var image:String
//
//
//    init(titlename:String,imagename:String) {
//        self.titlename = titlename
//        self.image = imagename
//
//    }
//}

struct CategoryInfo:Decodable
{
    var id:String?
    var catID:String?
    var path:String?
    var name:String?
}

@objcMembers class categoryRealm:Object
{
    dynamic var id:String?=""
    dynamic var catID:String?=""
    dynamic var path:String?=""
    dynamic var name:String?=""
    
    convenience  init(id:String,catID:String,path:String,name:String) {
        self.init()
        self.name=name
        self.catID=catID
        self.path=path
        self.id=id
    }
    override static func primaryKey()->String?{
        return "id"
    }
    
}
