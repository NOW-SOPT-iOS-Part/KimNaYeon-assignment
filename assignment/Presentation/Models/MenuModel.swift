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
            MenuModel(title: I18N.Main.home),
            MenuModel(title: I18N.Main.live),
            MenuModel(title: I18N.Main.tv),
            MenuModel(title: I18N.Main.movie),
            MenuModel(title: I18N.Main.paramount),
            MenuModel(title: I18N.Main.kbo)
        ]
    }
}
