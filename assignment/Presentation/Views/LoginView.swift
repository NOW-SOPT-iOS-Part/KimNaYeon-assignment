//
//  LoginView.swift
//  assignment
//
//  Created by 김나연 on 4/16/24.
//

import UIKit

import SnapKit

final class LoginView: BaseView {

    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .gray1
        label.font = .font(ofSize: 23, weight: .w500)
        return label
    }()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func setStyle() {
        backgroundColor = .black
    }
    
    override func setHierarchy() {
        self.addSubviews(titleLabel)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension LoginView {
    
}
