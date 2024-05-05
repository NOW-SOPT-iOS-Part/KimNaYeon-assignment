//
//  KobisResponseModel.swift
//  assignment
//
//  Created by 김나연 on 5/5/24.
//

import Foundation

struct DailyBoxOfficeResponseModel: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let movieName: String
    
    enum CodingKeys: String, CodingKey {
        case movieName = "movieNm"
    }
}
