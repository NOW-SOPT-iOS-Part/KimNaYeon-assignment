//
//  WelcomeView.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

import SnapKit

final class WelcomeView: BaseView {

    // MARK: - UI Components
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tving-logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let welcomeTitle: UILabel = {
        let label = UILabel()
        label.text = "nowsopt@naver.com 님\n반가워요!"
        label.textColor = .gray1
        label.font = .font(ofSize: 23, weight: .w700)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let goMainButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.goMainText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w600)
        button.backgroundColor = .red
        button.layer.cornerRadius = 3
        return button
    }()
    
    // MARK: - Methods
    
    override func setStyle() {
        backgroundColor = .black
    }
    
    override func setHierarchy() {
        self.addSubviews(logoImageView, welcomeTitle, goMainButton)
    }
    
    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(14)
            $0.horizontalEdges.equalToSuperview()
        }
        
        welcomeTitle.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        goMainButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(66)
        }
    }
}

// MARK: - Extensions

extension WelcomeView {
    
}
