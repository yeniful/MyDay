//
//  TableViewCell.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/31.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
