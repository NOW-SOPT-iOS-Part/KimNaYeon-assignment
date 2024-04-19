//
//  LoginView.swift
//  assignment
//
//  Created by 김나연 on 4/16/24.
//

import UIKit

import SnapKit

final class LoginView: BaseView {

    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.tvingIdLoginTitle
        label.textColor = .gray1
        label.font = .font(ofSize: 23, weight: .w500)
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray4
        textField.textColor = .gray2
        textField.font = .font(ofSize: 15, weight: .w600)
        textField.setPlaceholder(text: I18N.Auth.idText, color: .gray2, size: 15, weight: .w600)
        textField.setLeftPadding(amount: 22)
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray4
        textField.textColor = .gray2
        textField.font = .font(ofSize: 15, weight: .w600)
        textField.setPlaceholder(text: I18N.Auth.passwordText, color: .gray2, size: 15, weight: .w600)
        textField.setLeftPadding(amount: 22)
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle(I18N.Auth.loginText, for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w600)
        button.layer.cornerRadius = 3
        button.makeBorder(width: 1, color: .gray4)
        button.isEnabled = false
        return button
    }()
    
    private let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.findIdText, for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w600)
        return button
    }()
    
    private let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.findPasswordText, for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w600)
        return button
    }()
    
    private let findStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 33
        return stackView
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let noAccountLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.noAccountText
        label.textColor = .gray3
        label.font = .font(ofSize: 14, weight: .w600)
        return label
    }()
    
    let goToCreateNicknameButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.goToCreateNicknameText, for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w400)
        button.underlineTitle()
        return button
    }()
    
    private let accountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 33
        return stackView
    }()
    
    private let idClearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "icon_x-circle"), for: .normal)
        return button
    }()
    
    private let passwordClearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "icon_x-circle"), for: .normal)
        return button
    }()
    
    private let eyeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "icon_eye"), for: .normal)
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    override func setStyle() {
        backgroundColor = .black
        setIdTextFieldCustomClearButton()
        setPasswordTextFieldRightViews()
    }
    
    override func setHierarchy() {
        self.addSubviews(titleLabel, idTextField, passwordTextField, loginButton, findStackView, accountStackView)
        findStackView.addArrangedSubviews(findIdButton, divider, findPasswordButton)
        accountStackView.addArrangedSubviews(noAccountLabel, goToCreateNicknameButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
            $0.centerY.equalToSuperview()
        }
        
        accountStackView.snp.makeConstraints {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
    }
}

// MARK: - Extensions

extension LoginView {
    
    func setButtonAction() {
        idClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        passwordClearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        eyeButton.addTarget(self, action: #selector(eyeButtonDidTap), for: .touchUpInside)
    }
    
    func setIdTextFieldCustomClearButton() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(40)
        }
        stackView.addArrangedSubviews(idClearButton, paddingView)
        idTextField.rightView = stackView
        idTextField.rightViewMode = .whileEditing
    }
    
    func setPasswordTextFieldRightViews() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: self.frame.size.height))
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(76)
        }
        stackView.addArrangedSubviews(passwordClearButton, eyeButton, paddingView)
        passwordTextField.rightView = stackView
        passwordTextField.rightViewMode = .whileEditing
    }
    
    // MARK: - Actions
    
    @objc
    func clearButtonDidTap(_ sender: UIButton) {
        switch sender {
        case idClearButton:
            idTextField.text = ""
        case passwordClearButton:
            passwordTextField.text = ""
        default:
            return
        }
    }
    
    @objc
    func eyeButtonDidTap(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        sender.setImage(UIImage(named: passwordTextField.isSecureTextEntry ? "icon_eye" : "icon_eye-slash"), for: .normal)
    }
}
