//
//  ImageBannerModel.swift
//  assignment
//
//  Created by 김나연 on 5/3/24.
//

import UIKit
import Foundation

struct ImageBannerModel {
    let image: UIImage
}

extension ImageBannerModel {
    static func imageBannerData() -> [ImageBannerModel] {
        return [
            ImageBannerModel(image: .bearsWhiteRect),
            ImageBannerModel(image: .bearsBlackRect),
        ]
    }
}
