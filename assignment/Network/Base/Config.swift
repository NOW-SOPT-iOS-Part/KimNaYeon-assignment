//
//  Config.swift
//  assignment
//
//  Created by 김나연 on 5/5/24.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let kobisOpenAPIURL = "KOBIS_OPENAPI"
            static let kobisKey = "KOBIS_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let kobisOpenAPIURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.kobisOpenAPIURL] as? String else {
            fatalError("kobisOpenAPIURL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let kobisKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.kobisKey] as? String else {
            fatalError("kobisKey is not set in plist for this configuration.")
        }
        return key
    }()
}
