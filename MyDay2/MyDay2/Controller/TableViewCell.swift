//
//  TableViewCell.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/31.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var statusImageView: UIImageView?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var timeLogLabel: UILabel?
    
    
    // MARK: - Labels Setting
    // cell 안에 있는 라벨로 들어가는 item의 속성들
    func configureWithItem(item: TableViewDataModelItem) {
        statusImageView?.image = UIImage(named: item.statusImage ?? "error")
        descriptionLabel?.text = item.description
        timeLogLabel?.text = item.timeLog
    }
    
    
    // MARK: - Identifier
    // 하드코딩 대신 리터럴로 생성
    class var identifier: String {
        return String(describing: self)
    }
    
    
    // MARK: - nib
    // 하드코딩 대신 리터럴로 생성
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

