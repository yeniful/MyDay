//
//  DataInform.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/30.
//

import Foundation

// MARK: - Data Inform
struct DataInform {
    let name: String
    
    func timeLog (startDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let startDate = dateFormatter.date(from: startDate) ?? Date()
        let endDate = Date()
        let timeDifference = Int(endDate.timeIntervalSince(startDate)) / 3600
        return "\(timeDifference)시간 전"
    }
    
    enum Status: String {
        case wakeUp
        case workOut
        case meal
        case study
        case walk
        case youTube
        case sleep
        
        func StatusLabel() -> String {
            switch self{
            case .wakeUp:
                return "기상"
            case .workOut:
                return "운동"
            case .meal:
                return "식사"
            case .study:
                return "공부"
            case .walk:
                return "산책"
            case .youTube:
                return "유튜브"
            case .sleep:
                return  "취침"
            /* default:
                return "default status" */
            }
        }
        
        func StatusMessage() -> String {
            switch self{
            case .wakeUp:
                return "힘차게 하루를 시작해보아요!"
            case .workOut:
                return "건강한 몸에 건강한 정신이 깃든다!"
            case .meal:
                return "꼭꼭 씹어서 먹어요."
            case .study:
                return "영차영차 열공해요."
            case .walk:
                return "댕댕이들과 힐링타임을~"
            case .youTube:
                return "자기 전 유튜브는 못참지~"
            case .sleep:
                return  "수고했어~ 오늘도~ 내일은 더 신나는 일들이 가득할거에요!"
            /* default:
                return "default status" */
            }
        }
        
        func statusImage() -> String { self.rawValue }
    }
        
}
