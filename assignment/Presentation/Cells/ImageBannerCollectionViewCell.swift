//
//  ImageBannerCollectionViewCell.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

import SnapKit

final class ImageBannerCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageBannerCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray1
        return imageView
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
    
    func setHierarchy() {
        contentView.addSubviews(imageView)
    }
    
    func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ImageBannerCollectionViewCell {
    
    func configure(image: UIImage? = nil) {
        imageView.image = image
    }
}
