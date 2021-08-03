//
//  ViewController.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var deleteButton: UIButton?
    @IBAction func deleteAction(_ sender: UIButton) {
        datas = []
        myDayTableView.reloadData()
    }
    @IBOutlet weak var myDayTableView: UITableView!

    
    // MARK: - Properties
    let cellIdentifier: String = "cell"
    
    
    // MARK: - Data
    var datas = DataModel(datas: [])
    var datasCount: Int { datas.count }


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myDayTableView.delegate = self
        myDayTableView.dataSource = self
        
        myDayTableView.rowHeight = UITableView.automaticDimension
        myDayTableView.estimatedRowHeight = UITableView.automaticDimension
        
        // MARK: - Json Decoder
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "MyDayData") else {
            return
        }
        
        do {
            self.datas = try jsonDecoder.decode([Data].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }

}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? TableViewCell else { return TableViewCell() }

            let data: DataModel = self.datas[indexPath.row]
        cell.statusImageView?.image = UIImage(named: datas.status ?? "error")
            cell.descriptionLabel?.text = datas.status
            cell.timeAgoLabel?.text = datas.timeLog
    
            return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    
    
}
