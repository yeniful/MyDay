//
//  LocalService.swift
//  MyDay3
//
//  Created by Yeni Hwang on 2021/08/02.
//

// Json Decoder로 받아오는 것을 URLsession으로 받아오는 척 구현

import Foundation

class LocalService {
    var result: DataModel = DataModel(datas: [])
    let fileName: String
    let fileType: String

    init() {
        fileName = "MyDayData"
        fileType = "json"
        result = decode()
    }
    
    // jsonString
    func getJsonString() -> String {
        // path 추출
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else { return "" }
        // json string 추출
        guard let tempJsonString = try? String(contentsOfFile: path) else { return "" }
        return tempJsonString
    }
    
    
    // jsonDecoder
    func decode() -> DataModel {
        let jsonString = getJsonString()
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8) // jsonString -> data
        guard let data = data, let tempResult = try? decoder.decode(DataModel.self, from: data) else { return DataModel(datas: []) }
        return tempResult
    }
}
