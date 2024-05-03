//
//  HomeView.swift
//  assignment
//
//  Created by 김나연 on 4/30/24.
//

import UIKit

import SnapKit

enum Section: CaseIterable {
    case carousel
    case mustSeeContent
    case liveChannel
    case paramount
    case imageBanner
}

final class HomeView: BaseView {
    
    // MARK: - UI Components
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setSectionLayout())
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Methods
    
    override func setHierarchy() {
        self.addSubviews(collectionView)
    }
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension HomeView {
    
    func setInterSectionSpacing(_ layout: UICollectionViewCompositionalLayout) {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 18
        layout.configuration = config
    }
    
    func setSectionLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment -> NSCollectionLayoutSection? in
            let sectionType = Section.allCases[sectionIndex]
            switch sectionType {
            case .carousel:
                return self.getCarouselSectionLayout(sectionType: sectionType)
            case .mustSeeContent, .paramount:
                return self.getMovieSectionLayout(sectionType: sectionType)
            case .liveChannel:
                return self.getLiveChannelSectionLayout(sectionType: sectionType)
            case .imageBanner:
                return self.getImageBannerSectionLayout(sectionType: sectionType)
            }
        }
        setInterSectionSpacing(layout)
        return layout
    }
    
    func getCarouselSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(SizeLiterals.Screen.height * (498/812))
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let footer = getSectionFooter()
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = .init(top: 0, leading: 0, bottom: 11, trailing: 0)
        section.boundarySupplementaryItems = [footer]
        
        return section
    }

    func getMovieSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(98),
            heightDimension: .absolute(166)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let header = getSectionHeader()
        section.interGroupSpacing = 8
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 14, leading: 15, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    func getLiveChannelSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(138)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let header = getSectionHeader()
        section.interGroupSpacing = 7
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 8, leading: 15, bottom: 0, trailing: 0)

        return section
    }
    
    func getImageBannerSectionLayout(sectionType: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(58)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 49-18, leading: 0, bottom: 38, trailing: 0)
        
        return section
    }
    
    func getSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
       let header = NSCollectionLayoutBoundarySupplementaryItem(
           layoutSize: NSCollectionLayoutSize(
               widthDimension: .fractionalWidth(1),
               heightDimension: .absolute(23)
           ),
           elementKind: UICollectionView.elementKindSectionHeader,
           alignment: .topLeading
       )
       return header
    }
    
    func getSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(14)
            ),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottomLeading
//            absoluteOffset: CGPoint(x: -140, y: -10)
        )
        return footer
     }
}
