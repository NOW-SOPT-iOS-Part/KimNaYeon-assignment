//
//  String+.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

extension String {
    
    func getLabelContentSize(withFont font: UIFont) -> CGSize {
        let label = UILabel()
        label.font = font
        label.text = self
        return label.intrinsicContentSize
    }
}
