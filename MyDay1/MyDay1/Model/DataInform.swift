//
//  DataInform.swift
//  MyDay1
//
//  Created by Yeni Hwang on 2021/07/30.
//

import Foundation

// MARK: - Data Inform
/*
 {
   "name": "yeni",
   "status": "wakeUp",
   "timeLog": "2021-07-31 08:00"
 }
 */


// 타입(구조체) 생성 후 Codable 프로토콜을 준수하도록 채택
struct DataInform: Codable {
    
    let name: String?
    let status: String?
    let timeLog: String?

    /*
    enum Status: String {
        case wakeUp
        case workOut
        case brunch
        case study
        case walk
        case coding
        case youTube
        case sleep
        
        func statusMessage() -> String {
            switch self{
            case .wakeUp:
                return "일어났어요? 오늘 하루를 시작해봐요."
            case .workOut:
                return "운동 시작! 건강한 몸에 건강한 정신이 깃든다!"
            case .brunch:
                return "브런치 타임! 맛있게 먹어요. :)"
            case .study:
                return "뽜이아!! 열공 힘내요."
            case .walk:
                return "산책시간이에요. 댕댕이들과 힐링타임을~"
            case .coding:
                return "코딩할 때가 제일 멋져요!"
            case .youTube:
                return "자기 전 유튜브는 못참죠~"
            case .sleep:
                return  "수고했어🎵 오늘도🎶 잘자요 :)"
            /* default:
                return "default status" */
            }
        }
        
        func statusImage() -> String { self.rawValue }
    }
    
    // description
    var description: String {
        return self.name ?? "error" + ", " + "\(Data.Status.self)"
    }
 */
}
