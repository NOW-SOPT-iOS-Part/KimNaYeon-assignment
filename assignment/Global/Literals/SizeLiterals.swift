//
//  SizeLiterals.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

struct SizeLiterals {
    
    struct Screen {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let deviceRatio: CGFloat = screenWidth / screenHeight
    }
}
