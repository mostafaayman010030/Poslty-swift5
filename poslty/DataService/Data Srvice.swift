//
//  Data Srvice.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import Foundation
import UIKit
/*struct Dataservice
{
    static let instance=Dataservice()
        private let categories=[Category(titlename: "الاطباء", imagename: "doctor.jpg"),
                                Category(titlename: "ادوات طبيه", imagename: "tools.jpg"),
                                Category(titlename: "مستشفيات", imagename: "hospital.jpg"),
                                Category(titlename: "مطاعم", imagename: "resturant.jpg"),
                                Category(titlename: "كافيهات", imagename: "cafe.jpg"),
                                Category(titlename: "مكتبات", imagename: "library.jpg"),
                                Category(titlename: "مصالح حكوميه", imagename: "companys.jpg"),
                                Category(titlename: "ملابس", imagename: "clothes.jpg"),
                                Category(titlename: "شركات", imagename: "companys.jpg"),
                                Category(titlename: "كمبيوتر و تليفونات", imagename: "computer.jpg"),
                                Category(titlename: "قاعات افراح", imagename: "frah.jpg"),
                                Category(titlename: "مستلزمات افراح", imagename: "needs.jpg"),
                                Category(titlename: "مجوهرات", imagename: "jelary.jpg"),
                                Category(titlename: "لانجرى", imagename: "langry.jpg"),
                                Category(titlename: "عطور", imagename: "perf.jpg"),
                                Category(titlename: "اثاث", imagename: "fern.jpg"),
                                Category(titlename: "حرفيااات", imagename: "hand.jpg"),
                                Category(titlename: "سيارات", imagename: "cars.jpg"),
                                Category(titlename: "دراجات", imagename: "pisk.jpg"),
                                ]

        func getcategories() ->[Category]  {
            return categories
        }
}*/




class AlertStoryboardService {
    
    func alert()->ALertViewController
    {
        let storypord=UIStoryboard(name: "AlertStoryBoard", bundle: .main)
        let alertVc=storypord.instantiateViewController(identifier: alertStoryID) as! ALertViewController
        return alertVc
        
    }
    
}
