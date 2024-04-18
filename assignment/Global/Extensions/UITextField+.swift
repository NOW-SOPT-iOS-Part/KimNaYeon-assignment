//
//  UITextField+.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

extension UITextField {
    
    var isEmpty: Bool {
        if text?.isEmpty ?? true {
            return true
        }
        return false
    }
    
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setCustomClearButton() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        clearButton.setImage(UIImage(named: "icon_x-circle"), for: .normal)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(40)
        }
        stackView.addArrangedSubviews(clearButton, paddingView)
        
        self.rightView = stackView
        self.rightViewMode = .whileEditing
    }
    
    func setPlaceholder(text: String, color: UIColor, size: CGFloat, weight: FontWeight) {
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [ .foregroundColor: color,
                          .font: UIFont.font(ofSize: size, weight: weight)
            ].compactMapValues { $0 }
        )
    }
}

