//
//  CreateNicknameViewController.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

final class CreateNicknameViewController: BaseViewController {

    // MARK: - UI Components
    
    private let createNicknameView = CreateNicknameView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = createNicknameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonAction()
    }
    
    override func setStyle() {
        self.view.backgroundColor = .white
        self.modalPresentationStyle = .pageSheet
        if let sheet = self.sheetPresentationController {
            sheet.detents = [.medium()]
//            sheet.delegate = self
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 26
        }
    }
}

// MARK: - Extensions

extension CreateNicknameViewController {
    
    func setButtonAction() {
    }
}
