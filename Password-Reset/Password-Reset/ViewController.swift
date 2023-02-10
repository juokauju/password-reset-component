//
//  ViewController.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-07.
//

import UIKit

class ViewController: UIViewController {

    private let stackView = UIStackView()
    private let passwordTextView = PasswordTextView()
    private let newPasswordTextField = PasswordTextField(placeholderText: "New Password")
    private let repeatPasswordTextField = PasswordTextField(placeholderText: "Re-enter your password")
    private let passwordCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    private func style() {
        stackView.addArrangedSubview(passwordCriteriaView)
//        stackView.addArrangedSubview(repeatPasswordTextField)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
    }
}
