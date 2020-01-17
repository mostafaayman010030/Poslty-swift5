//
//  selectedBtnTableViewCell.swift
//  poslty
//
//  Created by Moustafa on 1/10/20.
//  Copyright © 2020 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit


class selectedBtnTableViewCell: UITableViewCell {

    @IBOutlet weak var tName: UILabel!
    @IBOutlet weak var tSpecialist: UILabel!
    @IBOutlet weak var tPhone: UILabel!
    @IBOutlet weak var tAddres: UILabel!
    
    @IBOutlet weak var cal1: uuubtn!
    
    @IBOutlet weak var cal2: uuubtn!
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var specialist: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
        func updateCell(item:resultInfo)
        {
            tName.text=" الاسم :"
            tSpecialist.text=" التخصص :"
            tPhone.text=" التليفون :"
            tAddres.text=" العناون :"
    
    
            rate.text=item.rate
            name.text=item.title
            specialist.text=item.content
            address.text=item.address
            phone.text=item.phone
        }

    
    
    
  
    
      
    func call(num:String)
        {
            let url:NSURL=URL(string:"tel://\(num)")! as NSURL
             UIApplication.shared.open(url as URL)
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
