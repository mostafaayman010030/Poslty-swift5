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
    
    let realm=RealmDataService.instance.realm
    
    
    
     var result: Results<NewsRealm>?
       var selectedCategory:Newsinfo?
    //   weak var delegate:transeDataDelegate?
       var listofNews = [Newsinfo]()
          {
              didSet{
                  DispatchQueue.main.async {
                      self.tableView.reloadData()
                      //self.navigationItem.title="\(self.listofCategories.count) countries Founded"
                  }
              }
              
          }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
                            //let writeObj=NewsRealm()
                            RealmDataService.instance.updateNewsRealm(c: resposnseee)
                            //print(RealmDataService.instance.listofCountries)
                        }
                        catch
                        {
                            print("error")
                        }

                    print(self.realm.configuration.fileURL)
                }
            
        }
        else
        {
            RealmDataService.instance.readNewsRealm()
            print(RealmDataService.instance.listofNews)
            print(RealmDataService.instance.listofNews.count)
                    
        }

    }
    
    
    
    

      func updateCategoryRealm(c:[Newsinfo]) {
              do{
                  try realm.write {
                      
                      for i in 0..<c.count
                     {
                      var obj:NewsRealm
//                      obj=categoryRealm(id: c[i].id ?? "", catID: c[i].catID ?? "", path: cpath+c[i].path! , name: c[i].name ?? "")
                        
                        var string = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
                        let str = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                        obj=NewsRealm(id: c[i].id ?? "", post_title: c[i].post_title ?? "", post_content: c[i].post_content ?? "")
                        c[i].images?[i] ?? ""
                      realm.add(obj, update: true)
                      
                      }
                      
                  }
                
                  print("wifi on")
              }
              catch
              {
                  print("Error fetch category")
              }
              
          }
          
      
      
          func readCategories(){
               result=realm.objects(NewsRealm.self)
              var item=[Newsinfo]()
              for x in result!
              {
    
                item.append(Newsinfo(id: x.id ?? "", post_title: x.post_title ?? "", post_content: x.post_content ?? ""))
//                  item.append(CategoryInfo(id: x.id ?? "", catID: x.catID ?? "", path: x.path ?? "", name: x.name ?? ""))
              }
              self.listofNews=item
              print("read Done")
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
