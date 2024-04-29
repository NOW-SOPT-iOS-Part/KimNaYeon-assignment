//
//  MainViewController.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let menuInteritemSpacing: CGFloat = 28
    private let menuBarInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    private let menuData = MenuModel.menuData()
    private var viewControllers: [UIViewController] = []
    private var currentMenuIndex: Int = 0 {
        didSet {
            moveIndicatorbar(to: currentMenuIndex)
        }
    }
    private var currentPageIndex = 0 {
        didSet {
            setPageVC(from: oldValue, to: currentPageIndex)
        }
    }
    
    // MARK: - UI Components
    
    private let rootView = MainView()
    private lazy var collectionView = rootView.collectionView
    private lazy var pageViewController = rootView.pageViewController
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegate()
        registerCell()
        setPageViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        moveIndicatorbar(to: 0)
    }
}

// MARK: - Extensions

private extension MainViewController {
    
    // MARK: - Methods
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }

    func registerCell() {
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
    
    func setPageViewController() {
        self.addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        addViewControllersData()
        guard let firstVC = viewControllers.first else { return }
        pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
    }
    
    func addViewControllersData() {
        viewControllers.append(HomeViewController())
        for _ in 0 ..< menuData.count-1 {
            let vc = UIViewController()
            vc.view.backgroundColor = .gray2
            viewControllers.append(vc)
        }
    }
    
    func setIndicatorBarIndex(to newIndex: Int) {
        self.currentMenuIndex = newIndex
    }
    
    func setPageIndex(to newIndex: Int) {
        self.currentPageIndex = newIndex
    }
    
    func moveIndicatorbar(to newIndex: Int) {
        let indexPath = IndexPath(item: newIndex, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell else { return }

        rootView.menuIndicatorBar.snp.remakeConstraints {
            $0.width.equalTo(cell.frame.width)
            $0.height.equalTo(3)
            $0.bottom.equalTo(rootView.indicatorBackgroundView.snp.bottom)
            $0.centerX.equalTo(cell)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func setPageVC(from currentIndex: Int, to newIndex: Int) {
        guard 0 <= newIndex && newIndex < viewControllers.count else { return }
        let direction: UIPageViewController.NavigationDirection = currentIndex < newIndex ? .forward : .reverse
        pageViewController.setViewControllers([viewControllers[newIndex]], direction: direction, animated: true)
        setIndicatorBarIndex(to: newIndex)
    }
    
    func checkIfBarAndPageAreInSameIndex(for currentIndex: Int) -> Bool {
        return currentMenuIndex == currentIndex
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newIndex = indexPath.item
        self.currentMenuIndex = newIndex
        setPageIndex(to: newIndex)
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(title: menuData[indexPath.item].title)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: menuData[indexPath.item].title
                .getLabelContentSize(withFont: .font(ofSize: 17, weight: .w400))
                .width,
            height: collectionView.frame.height
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return menuInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return menuBarInset
    }
}

extension MainViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let newVC = pendingViewControllers.first,
              let newIndex = viewControllers.firstIndex(of: newVC)
        else { return }
        setIndicatorBarIndex(to: newIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentPageIndex = viewControllers.firstIndex(of: currentVC)
        else { return }
        if !checkIfBarAndPageAreInSameIndex(for: currentPageIndex) {
            setIndicatorBarIndex(to: currentPageIndex)
        }
    }
}

extension MainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        return previousIndex < 0 ? nil : viewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        return nextIndex == viewControllers.count ? nil : viewControllers[nextIndex]
    }
}
