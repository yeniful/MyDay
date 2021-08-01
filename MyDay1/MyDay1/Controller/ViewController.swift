//
//  ViewController.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var myDayTableView: UITableView!
    
    // MARK: - Properties
    let cellIdentifier: String = "cell"
    
    var datas: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myDayTableView.delegate = self
        myDayTableView.dataSource = self
        
        myDayTableView.rowHeight = UITableView.automaticDimension
        myDayTableView.estimatedRowHeight = UITableView.automaticDimension
        
        // json 디코더로 애셋 데이터를 가져오기
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "MyDayData") else {
            return
        }
        
        do {
            self.datas = try jsonDecoder.decode([Data].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        // 테이블 뷰 리로드
        self.myDayTableView.reloadData()
    }

}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // guard let으로 바꾸기
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! TableViewCell
        
        let data: Data = self.datas[indexPath.row]
        cell.statusImageView?.image = UIImage(named: data.status ?? "error")
        cell.descriptionLabel?.text = data.status
        cell.timeAgoLabel?.text = data.timeLog

        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
