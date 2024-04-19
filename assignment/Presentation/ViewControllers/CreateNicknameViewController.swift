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
    
    func changeSaveButtonActivationState(to state: Bool) {
        saveButton.isEnabled = state
        saveButton.backgroundColor = state ? .red : .clear
        saveButton.makeBorder(width: state ? 0 : 1, color: state ? .clear : .gray4)
        saveButton.setTitleColor(state ? .white : .gray2, for: .normal)
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
            changeSaveButtonActivationState(to: true)
        } else {
            changeSaveButtonActivationState(to: false)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nicknameRegEx = "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$"
        if let _ = string.range(of: nicknameRegEx, options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
}
