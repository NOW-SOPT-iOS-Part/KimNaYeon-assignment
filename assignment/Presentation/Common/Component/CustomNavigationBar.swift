//
//  CustomNavigationBar.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

import SnapKit

class CustomNavigationBar: BaseView {
    
    // MARK: - UI Components

    private lazy var logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .tvingWhite
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(.bearsLogo, for: .normal)
        button.isHidden = true
        return button
    }()

    // MARK: - Properties
    
    var isLogoViewIncluded: Bool {
        get { !logoView.isHidden }
        set { logoView.isHidden = !newValue }
    }
    
    var isProfileButtonIncluded: Bool {
        get { !profileButton.isHidden }
        set { profileButton.isHidden = !newValue }
    }
    
    // MARK: - Methods
    
    override func setStyle() {
        backgroundColor = .clear
    }
    
    override func setHierarchy() {
        self.addSubviews(logoView, profileButton)
    }
    
    override func setLayout() {
        logoView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
        }
        
        profileButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(9)
            $0.centerY.equalToSuperview()
        }
    }
}

