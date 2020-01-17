//
//  PosltyTableViewController.swift
//  poslty
//
//  Created by Moustafa on 12/20/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire

//protocol transeDataDelegate: class {
//    func selectedCAtegory(vc:PosltyTableViewController, category:CategoryInfo)
//}
class PosltyTableViewController: UITableViewController {

    var imageselected:String?
    let realm=RealmDataService.instance.realm
    
    var result: Results<categoryRealm>?
    var selectedCategory:CategoryInfo?
 //   weak var delegate:transeDataDelegate?
    var listofCategories = [CategoryInfo]()
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
        tableView.tableFooterView=UIView()
       
        if CheckInternet.Connection()
        {
            let cUrl="http://bosla-assiut.com/mainCategories.php?fbclid=IwAR01_IqQvmQO4fZ_8Y30s6wgLBG44pbje9wmtpiwiHNt70QSv13ZtXAj2dQ"
            let url=URL(string: cUrl)
            Alamofire.request(url!).response { (response) in
                guard let jdata=response.data else{return}
                
                do
                {
                    let res = try JSONDecoder().decode([CategoryInfo].self, from: jdata)
                    self.updateCategoryRealm(c: res)
                    self.readCategories()
                    print(self.listofCategories)
                    print(self.realm.configuration.fileURL ?? "")
                }
                catch
                {
                    print("error")
                }
            }
            
            
        }
        else
        {
            self.readCategories()
            print("internet of")
            print(realm.configuration.fileURL ?? "")
        }
        
        
       }
    
    
    
    func updateCategoryRealm(c:[CategoryInfo]) {
            do{
                try realm.write {
                    
                    for i in 0..<c.count
                   {
                    var obj:categoryRealm
                    obj=categoryRealm(id: c[i].id ?? "", catID: c[i].catID ?? "", path: cpath+c[i].path! , name: c[i].name ?? "")
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
             result=realm.objects(categoryRealm.self)
            var item=[CategoryInfo]()
            for x in result!
            {
  
                item.append(CategoryInfo(id: x.id ?? "", catID: x.catID ?? "", path: x.path ?? "", name: x.name ?? ""))
            }
            self.listofCategories=item
            print("read Done")
        }
    
    
    
    
    
    
    
    
  
       let trans=customTransetion()
       @IBAction func menue(_ sender: UIBarButtonItem) {
//          guard let menueVC=storyboard?.instantiateViewController(identifier: "MTVC") else{return}
//           if trans.isPresenting == false
//           {
//               menueVC.modalPresentationStyle = .overCurrentContext
//            menueVC.transitioningDelegate=(self as UIViewControllerTransitioningDelegate)
//               present(menueVC, animated: true, completion: nil)
//           }
//           else
//           {
//               self.dismiss(animated: true, completion: nil)
//           }
//        
        
          guard let menueVC=storyboard?.instantiateViewController(identifier: "MTVC") else{return}
              if trans.isPresenting == false
              {
                 menueVC.modalPresentationStyle = .overCurrentContext
                menueVC.transitioningDelegate=self
                  present(menueVC, animated: true, completion: nil)
              }
              else
              {
                  
               menueVC.present(self, animated: true, completion: nil)
              }
           
       }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}



extension PosltyTableViewController
{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listofCategories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:poslaCategoryTableViewCell=tableView.dequeueReusableCell(withIdentifier: "pCell", for: indexPath)as? poslaCategoryTableViewCell
        {
               let item=listofCategories[indexPath.row]
                let e=CategoryInfo(id: item.id, catID: item.catID, path: item.path, name: item.name)
                cell.updateCategories(c: e)
                return cell
           }


        else
        {
            return poslaCategoryTableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

            let choose=listofCategories[indexPath.row]
            self.selectedCategory=CategoryInfo(id: choose.id, catID: choose.catID, path: choose.path, name: choose.name)

                            //when i want to  use delegate
        // self.delegate?.selectedCAtegory(vc: self, category: self.selectedCategory!)
        
        performSegue(withIdentifier: selectedCategoryIdent, sender: selectedCategory)

       
       
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destina=segue.destination as? selectedCtegoryViewController
        {
            destina.category=self.selectedCategory
            assert(sender as? CategoryInfo != nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
 
}







extension PosltyTableViewController:UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trans.isPresenting=true
        return trans
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        trans.isPresenting=false
        return trans
    }
}
