//
//  newsViewController.swift
//  poslty
//
//  Created by Moustafa on 12/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
class newsViewController: UIViewController {

    //var news:Results<Counry>!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm=RealmDataService.instance.realm
       // var  resull: Results<countryRalm>!
        print(realm.configuration.fileURL)
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView=UIView()
        
        if CheckInternet.Connection()
        {
           // let url1 = "https://restcountries.eu/rest/v2/all"
            let url1 = "http://bosla-assiut.com/fetchNews.php?fbclid=IwAR1wkF7PVN-am2NCkgeayN1m3nN2677X2gBjrmqZrvR-PBYPom4wapbWVng"
            
            let url=URL(string:url1)
            Alamofire.request(url!).response
                { (resposnse) in
                    guard let jdata=resposnse.data else{return}
                        do
                        {
                            let resposnseee=try JSONDecoder().decode([Newsinfo].self, from: jdata)
                            let writeObj=NewsRealm()
                            RealmDataService.instance.updateNewsRealm(c: resposnseee)
                            //print(RealmDataService.instance.listofCountries)
                        }
                        catch
                        {
                            print("error")
                        }

                    print(realm.configuration.fileURL)
                }
            
        }
        else
        {
            RealmDataService.instance.readNewsRealm()
            print(RealmDataService.instance.listofNews)
            print(RealmDataService.instance.listofNews.count)
                    
        }

    }
    
    
    
    
    
    
}





extension newsViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RealmDataService.instance.listofNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:newsTableViewCell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newsTableViewCell
        {
            let n=RealmDataService.instance.listofNews[indexPath.row]
            cell.updateNews(n: n)
            return cell
        }
        return newsTableViewCell()
    }
    
    
}
