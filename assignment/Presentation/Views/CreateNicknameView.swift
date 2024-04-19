//
//  CreateNicknameView.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import UIKit

import SnapKit

final class CreateNicknameView: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = I18N.Auth.enterNicknameTitle
        label.textColor = .black
        label.font = .font(ofSize: 23, weight: .w500)
        return label
    }()
    
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .gray4
        textField.font = .font(ofSize: 14, weight: .w600)
        textField.setLeftPadding(amount: 22)
        textField.setRightPadding(amount: 22)
        textField.backgroundColor = .gray2
        textField.layer.cornerRadius = 3
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(I18N.Auth.saveText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(ofSize: 14, weight: .w600)
        button.backgroundColor = .red
        button.layer.cornerRadius = 12
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    override func setHierarchy() {
        self.addSubviews(titleLabel, nicknameTextField, saveButton)
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        saveButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
}
