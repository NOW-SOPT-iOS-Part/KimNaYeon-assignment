//
//  HomeHeaderReusableView.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

import SnapKit

final class HomeHeaderReusableView: UICollectionReusableView {
    static let identifier = "HomeHeaderReusableView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font(ofSize: 15, weight: .w600)
        label.textColor = .white
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "전체보기"
        label.font = .font(ofSize: 11, weight: .w600)
        label.textColor = .gray3
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .gray3
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .clear
    }
    
    private func setHierarchy() {
        self.addSubviews(titleLabel, viewAllLabel, viewAllButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(23)
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        viewAllLabel.snp.makeConstraints {
            $0.trailing.equalTo(viewAllButton.snp.leading)
            $0.centerY.equalToSuperview()
        }

        viewAllButton.snp.makeConstraints {
            $0.size.equalTo(10)
            $0.trailing.equalToSuperview().inset(5)
            $0.centerY.equalToSuperview()
        }
    }
}

extension HomeHeaderReusableView {
    
    func configure(title: String) {
       titleLabel.text = title
    }
}
