//
//  WelcomeViewController.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

import SnapKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let welcomeView = WelcomeView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension WelcomeViewController {
    
}

#Preview {
    WelcomeViewController()
}
