//
//  ViewController.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myDayTableView: UITableView!
    
    // MARK: - Properties
    let cellidentifier: String = "cell"
    
    let dataCount = data.count
    let imageList: [String] = ["a", "b", "c"]
    let descriptionList: [String] = ["a", "b", "v"]
    let timeAgo: [String] = ["a", "b", "c"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myDayTableView.delegate = self
        myDayTableView.dataSource = self
        
        myDayTableView.rowHeight = UITableView.automaticDimension
        myDayTableView.estimatedRowHeight = UITableView.automaticDimension
    }

}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        // 셀에 들어갈 정보
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
