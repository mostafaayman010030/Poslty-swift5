//
//  RealmDataService.swift
//  poslty
//
//  Created by Moustafa on 12/24/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

enum countryError {
    case fetchError
    case saveError
    case readError
}

import Foundation
import RealmSwift


class RealmDataService
{
    private init(){}
    static let instance=RealmDataService()
    //var listofCountries=[countryRalm]()
    var listofNews=[NewsRealm]()
    let realm = try! Realm()
    
    
    func updateNewsRealm(c:[Newsinfo]){
        
        do
        {
            try! realm.write {

                 for i in 0..<c.count
                    {
                      
                        
                            let obje=NewsRealm(id: c[i].id ?? "" , post_title: c[i].post_title ?? "", post_content: c[i].post_content ?? "")
                                realm.add(obje, update: true)
                        
                    }
            }
        }
            
        
        catch
        {
            print("error Update")
        }
        print("internet on")
        
    }
    
    
    
    
    
    func readNewsRealm()
    {
        let result=realm.objects(NewsRealm.self)
        
        for x in result
            {
                
                self.listofNews.append(NewsRealm(id: x.id!, post_title: x.post_title ?? "", post_content: x.post_content ?? ""))
            }
    }
    
    
    
    
    
    
    

    
    
    
}

