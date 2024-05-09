//
//  MenuCollectionViewCell.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .font(ofSize: 17, weight: .w400)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.font = .font(ofSize: 17, weight: isSelected ? .w700 : .w400)
        }
    }
    
    func setHierarchy() {
        contentView.addSubviews(titleLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension MenuCollectionViewCell {
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
