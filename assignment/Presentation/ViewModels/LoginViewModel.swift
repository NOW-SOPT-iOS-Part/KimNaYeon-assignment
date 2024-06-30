//
//  LoginViewModel.swift
//  assignment
//
//  Created by 김나연 on 6/7/24.
//

import UIKit

import RxSwift
import RxRelay

enum TextFieldFocusType {
    case id
    case password
}

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}

final class LoginViewModel: ViewModelType {
    
    private var id: String?
    private var password: String?
    
    struct Input {
        let idTextFieldFocusEvent: Observable<TextFieldFocusType>
        let passwordTextFieldFocusEvent: Observable<TextFieldFocusType>
        let idTextFieldDidChangeEvent: Observable<String?>
        let passwordTextFieldDidChangeEvent: Observable<String?>
        let idTextFieldIsEntered: Observable<Bool>
        let passwordTextFieldIsEntered: Observable<Bool>
        let loginButtonDidTapEvent: Observable<Void>
    }
    
    struct Output {
        var textFieldFocus: Observable<TextFieldFocusType>
        var isAllEntered: Observable<Bool>
        var isValid = PublishRelay<Void>()
        var alert = PublishRelay<String>()
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let textFieldFocus = Observable
            .merge(
                input.idTextFieldFocusEvent,
                input.passwordTextFieldFocusEvent
            )
        let isAllEntered = Observable
            .combineLatest(
                input.idTextFieldIsEntered,
                input.passwordTextFieldIsEntered
            )
            .map { values in
                return values.0 && values.1
            }
        
        let output = Output(
            textFieldFocus: textFieldFocus,
            isAllEntered: isAllEntered
        )
        
        input.idTextFieldDidChangeEvent.subscribe(onNext: { [weak self] id in
            self?.id = id
        }).disposed(by: disposeBag)
        
        input.passwordTextFieldDidChangeEvent.subscribe(onNext: { [weak self] password in
            self?.password = password
        }).disposed(by: disposeBag)
        
        input.loginButtonDidTapEvent.subscribe(onNext: { [weak self] _ in
            let idRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
            
            guard let _ = self?.id?.range(of: idRegEx, options: .regularExpression) else {
                return output.alert.accept(I18N.Auth.emailValidationText)
            }
            
            guard let _ = self?.password?.range(of: pwRegEx, options: .regularExpression) else {
                return output.alert.accept(I18N.Auth.pwValidationText)
            }
            output.isValid.accept(Void())
        }).disposed(by: disposeBag)
        
        return output
    }
}
