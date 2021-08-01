//
//  TableViewDataModel.swift
//  MyDay2
//
//  Created by Yeni Hwang on 2021/08/01.
//

import Foundation

protocol TableViewDataModelDelegate: class {
    func didRecieveDataUpdate(data: [TableViewDataModelItem])
    func didFailDataUpdateWithError(error: Error)
}

class TableViewDataModel: NSObject {
    
    weak var delegate: TableViewDataModelDelegate?
    
    func requestData() {
        //  this two variables will be returned from either an API call or local JSON file. For tutorial purposes, I create them here and initialise with nil.
        let data: [AnyObject]? = nil
        let error: Error? = nil
               
        if let error = error {
            // handler error
            delegate?.didFailDataUpdateWithError(error: error)
        } else if let data = data {
            setDataWithResponse( response: data )
        }
        
    }
    
    private func handlerError(error: Error){
        
    }
    
    private func setDataWithResponse(response: [AnyObject]){
        var data = [TableViewDataModelItem]()
        for item in response {
            if let TableViewDataModelItem = TableViewDataModelItem(data: item as? [String: String]){
                data.append(TableViewDataModelItem)
            }
        }
        delegate?.didRecieveDataUpdate(data: data)
    }
}
