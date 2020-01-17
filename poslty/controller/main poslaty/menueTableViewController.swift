//
//  rightBarViewController.swift
//  Poslty
//
//  Created by Moustafa on 12/19/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

enum menueType:Int {
    case home
    case news
    case favo
    case search
    case connect
    case info
    case share
}

class menueTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func dis(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menueval = menueType(rawValue: indexPath.row)else{return}
        print(menueval)
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
