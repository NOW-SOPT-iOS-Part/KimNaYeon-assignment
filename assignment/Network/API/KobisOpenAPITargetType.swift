//
//  HomeTargetType.swift
//  assignment
//
//  Created by 김나연 on 5/5/24.
//

import Foundation

import Moya

enum KobisOpenAPITargetType {
    case getDailyBoxOffice(key: String, targetDate: String)
}

extension KobisOpenAPITargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.kobisOpenAPIURL)!
    }
    
    var path: String {
        switch self {
        case .getDailyBoxOffice:
            return "/boxoffice/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDailyBoxOffice:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getDailyBoxOffice(let key, let targetDate):
            return .requestParameters(parameters: ["key": key, "targetDt": targetDate], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getDailyBoxOffice:
            return ["Content-Type": "application/json"]
        }
    }
}
