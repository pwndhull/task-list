//
//  TableViewCell.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
