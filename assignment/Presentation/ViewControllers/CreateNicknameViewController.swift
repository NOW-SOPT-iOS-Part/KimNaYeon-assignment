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
    
    override func setDelegate() {
        nicknameTextField.delegate = self
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

extension CreateNicknameViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if !nicknameTextField.isEmpty {
            saveButton.isEnabled = true
            saveButton.backgroundColor = .red
            saveButton.makeBorder(width: 0, color: .clear)
            saveButton.setTitleColor(.white, for: .normal)
        } else {
            saveButton.isEnabled = false
            saveButton.backgroundColor = .clear
            saveButton.makeBorder(width: 1, color: .gray4)
            saveButton.setTitleColor(.gray2, for: .normal)
        }
    }
}
