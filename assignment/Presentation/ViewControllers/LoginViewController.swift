//
//  LoginViewController.swift
//  assignment
//
//  Created by 김나연 on 4/16/24.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    private var nickname = ""
    
    // MARK: - UI Components
    
    private let rootView = LoginView()
    private lazy var loginButton = rootView.loginButton
    private lazy var goToCreateNicknameButton = rootView.goToCreateNicknameButton
    private lazy var idTextField = rootView.idTextField
    private lazy var passwordTextField = rootView.passwordTextField
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        setButtonAction()
    }
    
    private func bindViewModel() {
        let idTextFieldFocusEvent = idTextField.rx.controlEvent(.editingDidBegin)
            .map { return TextFieldFocusType.id }
            .asObservable()
        let passwordTextFieldFocusEvent = passwordTextField.rx.controlEvent(.editingDidBegin)
            .map { return TextFieldFocusType.password }
            .asObservable()
        let idTextFieldIsEntered = idTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { return !$0.isEmpty }
            .asObservable()
        let passwordTextFieldIsEntered = passwordTextField.rx.text
            .orEmpty
            .distinctUntilChanged()
            .map { return !$0.isEmpty }
            .asObservable()
        
        let input = LoginViewModel.Input(
            idTextFieldFocusEvent: idTextFieldFocusEvent,
            passwordTextFieldFocusEvent: passwordTextFieldFocusEvent,
            idTextFieldDidChangeEvent: idTextField.rx.text.asObservable(),
            passwordTextFieldDidChangeEvent: passwordTextField.rx.text.asObservable(),
            idTextFieldIsEntered: idTextFieldIsEntered,
            passwordTextFieldIsEntered: passwordTextFieldIsEntered,
            loginButtonDidTapEvent: loginButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.textFieldFocus.subscribe(onNext: { [weak self] textFieldType in
            switch textFieldType {
            case .id:
                self?.idTextField.makeBorder(width: 1, color: .gray2)
                self?.passwordTextField.makeBorder(width: 0, color: .clear)
            case .password:
                self?.passwordTextField.makeBorder(width: 1, color: .gray2)
                self?.idTextField.makeBorder(width: 0, color: .clear)
            }
        }).disposed(by: disposeBag)
        
        output.isAllEntered.subscribe(onNext: { [weak self] isAllEntered in
            self?.changeLoginButtonActivationState(to: isAllEntered ? true : false)
        }).disposed(by: disposeBag)
        
        output.isValid.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let welcomeVC = WelcomeViewController()
            welcomeVC.nickname = self.nickname
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        }).disposed(by: disposeBag)
        
        output.alert.subscribe(onNext: { [weak self] text in
            self?.makeAlert(title: "", message: text)
        }).disposed(by: disposeBag)
    }
}

// MARK: - Extensions

private extension LoginViewController {
    
    func setButtonAction() {
        goToCreateNicknameButton.addTarget(self, action: #selector(goToCreateNicknameButtonDidTap), for: .touchUpInside)
    }
    
    func changeLoginButtonActivationState(to state: Bool) {
        loginButton.isEnabled = state
        loginButton.backgroundColor = state ? .red : .black
        loginButton.setTitleColor(state ? .white : .gray2, for: .normal)
    }
    
    // MARK: - Actions
    
    @objc func goToCreateNicknameButtonDidTap() {
        let createNicknameVC = CreateNicknameViewController()
        createNicknameVC.delegate = self
        createNicknameVC.modalPresentationStyle = .pageSheet
        self.present(createNicknameVC, animated: true)
    }
}

extension LoginViewController: DataBindProtocol {
    func dataBind(nickname: String) {
        self.nickname = nickname
    }
}
