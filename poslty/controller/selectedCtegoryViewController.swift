//
//  chossenViewController.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import RealmSwift
class selectedCtegoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var item:selectedInfo?
    var category:CategoryInfo?
    var listOfItems=[selectedInfo]()
    {
              didSet{
                  DispatchQueue.main.async {
                      self.tableView.reloadData()
                      //self.navigationItem.title="\(self.listofCategories.count) countries Founded"
                  }
              }
              
          }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var choimage: UIImageView!
    var id=""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title=category?.name
        let imageUrl=URL(string: (category?.path!)!)
        choimage.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "d.png"), options: .handleCookies, completed: nil)
        id="\(category?.catID! ?? "")"
        print(category?.catID! ?? "")
        loadItems()
        tableView.delegate=self
        tableView.dataSource=self
        tableView.tableFooterView = UIView()
        
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
 
    func loadItems()
    {
        let surl="http://bosla-assiut.com/subCategory.php?parent=\(id)"
        let url=URL(string: surl)
        print(url!)
        Alamofire.request(url!).response { (response) in
            guard let jdata=response.data else{return}
            
            do
            {
                let res = try JSONDecoder().decode([selectedInfo].self, from: jdata)
                self.listOfItems=res
                
                print(self.listOfItems)
                print(self.listOfItems.count)
            }
            catch
            {
                print("error")
            }
            
        }
        
    }
    
    
    
  
}










extension selectedCtegoryViewController
{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return self.listOfItems.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if let cell:choosenTableViewCell=tableView.dequeueReusableCell(withIdentifier: chossenCell, for: indexPath)as? choosenTableViewCell
          {
              let item=self.listOfItems[indexPath.row]
           // print(item.name)
            cell.btn.tag=indexPath.row
//            [cell.btn addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
//            cell.btn.addTarget(self, action: #selector(clicked(index: cell.btn.tag)), for: .touchUpInside)

            cell.btn.addTarget(self,action:#selector(clicked),
                               for:.touchUpInside)
            cell.updateBtn(item: item)
            
              return cell
          }
          else
          {
              return choosenTableViewCell()
          }
      }
    @objc func clicked(sender:uuubtn)
    {

        

        print(sender.tag,sender.currentTitle)
        let choose=listOfItems[sender.tag]
        self.item=choose
        print("aaa",item!)
        performSegue(withIdentifier: "selectedItem", sender: item)
    }

    
 
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let destina=segue.destination as? selectedBtnViewController
                {
                    destina.rItem=self.item
                   // assert(sender as? CategoryInfo != nil)
                }
            }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
