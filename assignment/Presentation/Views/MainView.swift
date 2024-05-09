//
//  MainView.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

import SnapKit

final class MainView: BaseView {
    
    // MARK: - UI Components
    
    let navigationBar: CustomNavigationBar = {
        let navigationBar = CustomNavigationBar()
        navigationBar.isLogoViewIncluded = true
        navigationBar.isProfileButtonIncluded = true
        return navigationBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let indicatorBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        view.isHidden = true
        return view
    }()
    
    let menuIndicatorBar: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return pageVC
    }()
    
    // MARK: - Methods
    
    override func setStyle() {
        backgroundColor = .black
    }
    
    override func setHierarchy() {
        self.addSubviews(pageViewController.view, navigationBar, collectionView, indicatorBackgroundView, menuIndicatorBar)
    }
    
    override func setLayout() {
        pageViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        navigationBar.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.height.equalTo(27)
            $0.top.equalTo(navigationBar.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview()
        }
        
        indicatorBackgroundView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(12)
        }

        menuIndicatorBar.snp.makeConstraints {
            $0.width.equalTo(0)
            $0.height.equalTo(3)
            $0.leading.equalTo(18)
            $0.bottom.equalTo(indicatorBackgroundView.snp.top)
        }
    }
}
