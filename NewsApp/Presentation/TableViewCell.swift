//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Adam on 21/01/2020.
//  Copyright © 2020 Adam. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var title: UITextView!
    @IBOutlet weak var isLong: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
