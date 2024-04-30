//
//  HomeFooterReusableView.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

import SnapKit

final class HomeFooterReusableView: UICollectionReusableView {
    static let identifier = "HomeFooterReusableView"
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray3
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setPageControlSize(scale: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubview(pageControl)
    }
    
    private func setLayout() {
        pageControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setPageControlSize(scale: CGFloat) {
        pageControl.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}

extension HomeFooterReusableView {
    
    func configure(pageNumber: Int) {
        pageControl.numberOfPages = pageNumber
    }
}
