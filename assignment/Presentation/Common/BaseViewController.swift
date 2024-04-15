//
//  BaseViewController.swift
//  assignment
//
//  Created by 김나연 on 4/16/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setStyle()
        setHierarchy()
        setLayout()
        setDelegate()
        setRegister()
    }
    
    /// Data와 UI를 bind 합니다.
    func bindViewModel() {}
    /// View의 Style을 set 합니다.
    func setStyle() {}
    /// View의 Hierarchy를 set 합니다.
    func setHierarchy() {}
    /// View의 Layout을 set 합니다.
    func setLayout() {}
    /// View의 Delegate을 set 합니다.
    func setDelegate() {}
    /// View의 Register를 set 합니다.
    func setRegister() {}
}
