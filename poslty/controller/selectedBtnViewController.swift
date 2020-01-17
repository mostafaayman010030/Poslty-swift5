//
//  selectedBtnViewController.swift
//  poslty
//
//  Created by Moustafa on 1/10/20.
//  Copyright © 2020 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import Alamofire
class selectedBtnViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
 
 
    
    
    
    
    
    
     var rItem:selectedInfo?
     var id=""
     var lisetOfRsults=[resultInfo](){
         didSet
         {
             DispatchQueue.main.async {
             
                 self.tableView.reloadData()
             }
         }
     }
     override func viewDidLoad() {
         super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        title=rItem?.name
         print(rItem?.id)
         id=rItem!.id!
         //print("---------------------------")
         //tableView.tableFooterView=UIView()
         loadItems()
        
    
     }
     
     
     
     func loadItems()
       {
           let surl="http://bosla-assiut.com/fetchPostsApi.php?term_id=\(id)"
           let url=URL(string: surl)
           print(url!)
           Alamofire.request(url!).response { (response) in
               guard let jdata=response.data else{return}
               
               do
               {
                   let res = try JSONDecoder().decode([resultInfo].self, from: jdata)
                
                   self.lisetOfRsults=res

                   print(self.lisetOfRsults)
                   print(self.lisetOfRsults.count)
                print("Done")
               }
               catch
               {
                   print("error")
               }
               
           }
           
       }

     // MARK: - Table view data source

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
       print("nn",self.lisetOfRsults.count)
         return self.lisetOfRsults.count
     }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? selectedBtnTableViewCell
        {
            let item=lisetOfRsults[indexPath.row]
            print(item)
            cell.cal1.tag=indexPath.row
            cell.cal2.tag=indexPath.row
            cell.cal1.addTarget(self, action: #selector(phoneCall), for: .touchUpInside)
            cell.cal2.addTarget(self, action: #selector(phoneCall), for: .touchUpInside)
            cell.updateCell(item: item)
            
            return cell
        }
        return selectedBtnTableViewCell()
    }
    
    @objc func phoneCall(sender:uuubtn)
    {
        let item=lisetOfRsults[sender.tag]
        print(item)
        var phone=item.phone
        
        print(phone)
        self.call(num: phone!)

    }
    func call(num:String)
                  {
                      let url:NSURL=URL(string:"tel://\(num)")! as NSURL
                       UIApplication.shared.open(url as URL)
                    print("call Done")
                  }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 360
//    }
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
