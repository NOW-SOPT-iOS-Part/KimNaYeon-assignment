//
//  LiveChannel.swift
//  assignment
//
//  Created by 김나연 on 5/3/24.
//

import UIKit
import Foundation

struct LiveChannelModel {
    let thumbnail: UIImage?
    let rank: Int
    let channel: String
    let programName: String
    let viewership: Float
}

extension LiveChannelModel {
    static func liveChannelData() -> [LiveChannelModel] {
        return [
            LiveChannelModel(thumbnail: nil, rank: 1, channel: "OCN Movies", programName: "헝거게임: 판엠의 불꽃", viewership: 81.3),
            LiveChannelModel(thumbnail: nil, rank: 2, channel: "투니버스", programName: "명탐정 코난 극장판: 베이커가의 망령", viewership: 27.4),
            LiveChannelModel(thumbnail: nil, rank: 3, channel: "tvN", programName: "지구오락실2", viewership: 15.3),
            LiveChannelModel(thumbnail: nil, rank: 4, channel: "tvN DRAMA", programName: "눈물의 여왕", viewership: 13.2),
            LiveChannelModel(thumbnail: nil, rank: 5, channel: "YTN", programName: "YTN 24", viewership: 4.7),
        ]
    }
}
