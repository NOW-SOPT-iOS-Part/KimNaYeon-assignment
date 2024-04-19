//
//  CreateNicknameViewController.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

protocol DataBindProtocol: AnyObject {
    func dataBind(nickname: String)
}

final class CreateNicknameViewController: BaseViewController {

    // MARK: - Properties
    
    weak var delegate: DataBindProtocol?
    
    // MARK: - UI Components
    
    private let createNicknameView = CreateNicknameView()
    private lazy var saveButton = createNicknameView.saveButton
    private lazy var nicknameTextField = createNicknameView.nicknameTextField
    
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
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 26
        }
    }
}

// MARK: - Extensions

extension CreateNicknameViewController {
    
    func setButtonAction() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func saveButtonDidTap() {
        if let text = nicknameTextField.text {
            delegate?.dataBind(nickname: text)
            self.dismiss(animated: true)
        }
    }
}
