//
//  WelcomeViewController.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

import SnapKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - Properties
    
    var nickname: String = ""
    
    // MARK: - UI Components
    
    private lazy var welcomeView = WelcomeView(nickname: nickname)
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
}

// MARK: - Extensions

extension WelcomeViewController {
    
    func setNavigationBar() {
//        self.navigationController?.isNavigationBarHidden = true
    }
}
