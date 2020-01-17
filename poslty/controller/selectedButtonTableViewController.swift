//
//  selectedButtonTableViewController.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import Alamofire
class selectedButtonTableViewController: UITableViewController {

    
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

        title=rItem?.name
        print(rItem?.id)
        id=rItem!.id!
        //print("---------------------------")
        tableView.tableFooterView=UIView()
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
              }
              catch
              {
                  print("error")
              }
              
          }
          
      }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      
        return self.lisetOfRsults.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if let cell:selectedTableViewCell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as? selectedTableViewCell
//              {
//                let item=lisetOfRsults[indexPath.row]
//                cell.updateCell(item: item)
//                
//                return cell
//              }
//              else
//              {
//                  
//                return selectedTableViewCell()
//              }
//        
//    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    

}
