//
//  newsTableViewCell.swift
//  poslty
//
//  Created by Moustafa on 12/22/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit

class newsTableViewCell: UITableViewCell {

    @IBOutlet weak var imaggge: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imaggge.layer.cornerRadius=imaggge.bounds.width/2
        imaggge.layer.masksToBounds=true
    }
    
    
    
    func updateNews(n:NewsRealm)
    {
        imaggge.image=UIImage(named: "")
        title.text=n.post_title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
