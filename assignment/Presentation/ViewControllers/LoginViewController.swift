//
//  LoginViewController.swift
//  assignment
//
//  Created by 김나연 on 4/16/24.
//

import UIKit

import SnapKit

final class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var nickname = ""
    
    // MARK: - UI Components
    
    private let loginView = LoginView()
    private lazy var loginButton = loginView.loginButton
    private lazy var goToCreateNicknameButton = loginView.goToCreateNicknameButton
    private lazy var idTextField = loginView.idTextField
    private lazy var passwordTextField = loginView.passwordTextField
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonAction()
    }
    
    override func setDelegate() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - Extensions

extension LoginViewController {
    
    func setButtonAction() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        goToCreateNicknameButton.addTarget(self, action: #selector(goToCreateNicknameButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    func loginButtonDidTap() {
        if let id = idTextField.text, let pw = passwordTextField.text {
            if id.isValidEmail() {
                if pw.isValidPassword() {
                    let welcomeVC = WelcomeViewController()
                    welcomeVC.nickname = nickname
                    self.navigationController?.pushViewController(welcomeVC, animated: true)
                } else {
                    makeAlert(title: "", message: I18N.Auth.pwValidationText)
                }
            } else {
                makeAlert(title: "", message: I18N.Auth.emailValidationText)
            }
        }
    }
    
    @objc func goToCreateNicknameButtonDidTap() {
        let createNicknameVC = CreateNicknameViewController()
        createNicknameVC.delegate = self
        createNicknameVC.modalPresentationStyle = .pageSheet
        self.present(createNicknameVC, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.makeBorder(width: 1, color: .gray2)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.makeBorder(width: 0, color: .clear)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if !idTextField.isEmpty, !passwordTextField.isEmpty {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .red
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .black
            loginButton.setTitleColor(.gray2, for: .normal)
        }
    }
}

extension LoginViewController: DataBindProtocol {
    func dataBind(nickname: String) {
        self.nickname = nickname
    }
}
