//
//  HomeViewController.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    /// dummy data
    private let carouselMovies = [
        ImageLiterals.Image.yourNameIs,
        ImageLiterals.Image.suzume,
        ImageLiterals.Image.lordOfTheRings,
        ImageLiterals.Image.harrypotter,
        ImageLiterals.Image.yourNameIs,
        ImageLiterals.Image.suzume,
        ImageLiterals.Image.lordOfTheRings,
        ImageLiterals.Image.harrypotter
    ]
    private let movies = [
        [ImageLiterals.Image.signal, "시그널"],
        [ImageLiterals.Image.harrypotter, "해리포터와 마법사의 돌"],
        [ImageLiterals.Image.lordOfTheRings, "반지의 제왕"],
        [ImageLiterals.Image.suzume, "스즈메의 문단속"],
        [ImageLiterals.Image.signal, "시그널"],
        [ImageLiterals.Image.harrypotter, "해리포터와 마법사의 돌"],
        [ImageLiterals.Image.lordOfTheRings, "반지의 제왕"],
        [ImageLiterals.Image.suzume, "스즈메의 문단속"],
    ]
    private let liveChannels = [
        [1, "OCN Movies", "헝거게임: 판엠의 불꽃", 81.3],
        [2, "투니버스", "명탐정 코난 극장판: 베이커가의 망령", 27.4],
        [3, "tvN", "지구오락실2", 15.3],
        [4, "tvN DRAMA", "눈물의 여왕", 13.2],
        [5, "YTN", "YTN 24", 4.7],
    ]
    private let imageBanners = [
        ImageLiterals.Image.bears_white_rect,
        ImageLiterals.Image.bears_black_rect
    ]
    
    // MARK: - UI Components
    
    private let rootView = HomeView()
    private lazy var collectionView = rootView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        registerCell()
    }
}

// MARK: - Extensions

private extension HomeViewController {
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func registerCell() {
        collectionView.register(ImageCarouselCollectionViewCell.self, forCellWithReuseIdentifier: ImageCarouselCollectionViewCell.identifier)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.register(ChannelCollectionViewCell.self, forCellWithReuseIdentifier: ChannelCollectionViewCell.identifier)
        collectionView.register(ImageBannerCollectionViewCell.self, forCellWithReuseIdentifier: ImageBannerCollectionViewCell.identifier)
        
        collectionView.register(HomeHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderReusableView.identifier)
        collectionView.register(HomeFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeFooterReusableView.identifier)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = Section.allCases[section]
        switch sectionType {
        case .carousel, .mustSeeContent, .paramount:
            return 8
        case .liveChannel:
            return 5
        case .imageBanner:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .carousel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCarouselCollectionViewCell.identifier, for: indexPath) as? ImageCarouselCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(image: carouselMovies[indexPath.item])
            return cell
        case .liveChannel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else { return UICollectionViewCell() }
            let data = liveChannels[indexPath.item]
            cell.configure(
                image: nil,
                rank: data[0] as! Int,
                channel: data[1] as! String,
                program: data[2] as! String,
                viewership: data[3] as! Double
            )
            return cell
        case .mustSeeContent, .paramount:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            let data = movies[indexPath.item]
            cell.configure(
                image: data[0] as? UIImage,
                title: data[1] as! String
            )
            return cell
        case .imageBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageBannerCollectionViewCell.identifier, for: indexPath) as? ImageBannerCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(image: imageBanners[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeHeaderReusableView.identifier, for: indexPath) as? HomeHeaderReusableView
            else { return UICollectionReusableView() }
            
            let section = Section.allCases[indexPath.section]
            switch section {
            case .mustSeeContent:
                header.configure(title: "티빙에서 꼭 봐야하는 콘텐츠")
            case .liveChannel:
                header.configure(title: "인기 LIVE 채널")
            case .paramount:
                header.configure(title: "1화 무료! 파라마운트+ 인기 시리즈")
            default:
                header.configure(title: "")
            }
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeFooterReusableView.identifier, for: indexPath) as? HomeFooterReusableView
            else { return UICollectionReusableView() }
            footer.configure(pageNumber: 8)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
}
