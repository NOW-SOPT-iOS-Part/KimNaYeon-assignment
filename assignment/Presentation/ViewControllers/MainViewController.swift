//
//  MainViewController.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let rootView = MainView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
