//
//  StringLiterals.swift
//  assignment
//
//  Created by 김나연 on 4/19/24.
//

import Foundation

enum I18N {
    
    enum Auth {
        static let tvingIdLoginTitle = "TVING ID 로그인"
        static let idText = "아이디"
        static let passwordText = "비밀번호"
        static let loginText = "로그인하기"
        static let findIdText = "아이디 찾기"
        static let findPasswordText = "비밀번호 찾기"
        static let noAccountText = "아직 계정이 없으신가요?"
        static let goToCreateNicknameText = "닉네임 만들러가기"
        static let goMainText = "메인으로"
        static let welcomeTitle = " 님\n반가워요!"
        static let emailValidationText = "입력된 아이디가 이메일 형식 조건에 맞지 않습니다. 올바른 형식으로 다시 입력해주세요."
        static let pwValidationText = "입력된 비밀번호가 조건에 맞지 않습니다. 올바른 형식으로 다시 입력해주세요."
        static let enterNicknameTitle = "닉네임을 입력해주세요"
        static let saveText = "저장하기"
    }
    
    enum Main {
        static let home = "홈"
        static let live = "실시간"
        static let tv = "TV프로그램"
        static let movie = "영화"
        static let paramount = "파라마운트+"
        static let kbo = "KBO"
    }
    
    enum Home {
        static let mustSeeContentText = "티빙에서 꼭 봐야하는 콘텐츠"
        static let liveChannlText = "인기 LIVE 채널"
        static let paramountText = "1화 무료! 파라마운트+ 인기 시리즈"
    }
}
