//
//  poslaCategoryTableViewCell.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import SDWebImage
class poslaCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var im: UIImageView!
    
    @IBOutlet weak var tit: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        im.layer.cornerRadius=5.0
        im.layer.masksToBounds=true
        // Initialization code
    }
 
    
       func updateCategories(c:CategoryInfo)
        {

            let url=URL(string: c.path!)
            im.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "li.png"), options: .handleCookies, completed: nil)            
            tit.text=c.name
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
