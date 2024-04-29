//
//  MenuModel.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import Foundation

struct MenuModel {
    let title: String
}

extension MenuModel {
    static func menuData() -> [MenuModel] {
        return [
            MenuModel(title: "홈"),
            MenuModel(title: "실시간"),
            MenuModel(title: "TV프로그램"),
            MenuModel(title: "영화"),
            MenuModel(title: "파라마운트+"),
            MenuModel(title: "KBO")
        ]
    }
}
