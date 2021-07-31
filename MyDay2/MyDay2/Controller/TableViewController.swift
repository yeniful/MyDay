//
//  TableViewController.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/31.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - DataSource
    private let dataSource = TableViewDataModel()
    
    
    // MARK: - Empty dataArray
    fileprivate var dataArray = [TableViewDataModelItem]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up tableView and register nib
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        dataSource.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        dataSource.requestData()
    }
}


extension TableViewController: UITableViewDataSource {
    // cell의 수(dataArray 원소의 개수) 리턴
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // cell 채우고 cell 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell을 dequeue, optional downcast
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as?
                                        TableViewCell else {
                                        return UITableViewCell()
        }
        // cell 구성
        cell.configureWithItem(item: dataArray[indexPath.row])
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: TableViewDataModelDelegate {
    func didFailDataUpdateWithError(error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    func didRecieveDataUpdate(data: [TableViewDataModelItem]) {
        dataArray = data
    }
}
