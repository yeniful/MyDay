//
//  TableViewCell.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/31.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
