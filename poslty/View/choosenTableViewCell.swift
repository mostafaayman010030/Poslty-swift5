//
//  choosenTableViewCell.swift
//  poslty
//
//  Created by Moustafa on 12/21/19.
//  Copyright © 2019 Moustafa Ayman Ahmed. All rights reserved.
//

import UIKit
import Foundation
class choosenTableViewCell: UITableViewCell {

    @IBOutlet weak var btn: uuubtn!
    override func awakeFromNib() {
        super.awakeFromNib()
        btn.layer.cornerRadius=20.0
    }
    func updateBtn(item:selectedInfo)
    {
        btn.setTitle(item.name, for: .normal)
     
    }

  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
