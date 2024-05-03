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
    private let carouselMovies = MovieModel.carouselMovieData()
    private let movies = MovieModel.movieData()
    private let liveChannels = LiveChannelModel.liveChannelData()
    private let imageBanners = ImageBannerModel.imageBannerData()
    
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
        case .carousel:
            return carouselMovies.count
        case .mustSeeContent, .paramount:
            return movies.count
        case .liveChannel:
            return liveChannels.count
        case .imageBanner:
            return imageBanners.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .carousel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCarouselCollectionViewCell.identifier, for: indexPath) as? ImageCarouselCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(image: carouselMovies[indexPath.item].image)
            return cell
        case .liveChannel:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath) as? ChannelCollectionViewCell else { return UICollectionViewCell() }
            let data = liveChannels[indexPath.item]
            cell.configure(
                image: data.thumbnail,
                rank: data.rank,
                channel: data.channel,
                program: data.programName,
                viewership: data.viewership
            )
            return cell
        case .mustSeeContent, .paramount:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
            let data = movies[indexPath.item]
            cell.configure(image: data.image, title: data.title)
            return cell
        case .imageBanner:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageBannerCollectionViewCell.identifier, for: indexPath) as? ImageBannerCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(image: imageBanners[indexPath.item].image)
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
                header.configure(title: I18N.Home.mustSeeContentText)
            case .liveChannel:
                header.configure(title: I18N.Home.liveChannlText)
            case .paramount:
                header.configure(title: I18N.Home.paramountText)
            default:
                header.configure(title: "")
            }
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeFooterReusableView.identifier, for: indexPath) as? HomeFooterReusableView
            else { return UICollectionReusableView() }
            footer.configure(pageNumber: carouselMovies.count)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
}
