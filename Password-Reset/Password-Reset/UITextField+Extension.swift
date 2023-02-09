//
//  UITextField+Extension.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-08.
//

import UIKit

extension UITextField {
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        sender.isSelected.toggle()
    }
}

