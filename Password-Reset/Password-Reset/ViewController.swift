//
//  ViewController.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-07.
//

import UIKit

class ViewController: UIViewController {

    private let stackView = UIStackView()
    private let newPasswordTextField = PasswordTextField(placeholderText: "New Password")
    private let confirmPasswordTextField = PasswordTextField(placeholderText: "Re-enter your password")
    private let statusView = PasswordStatusView()
    private let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        // Do any additional setup after loading the view.
    }


}

extension ViewController {
    private func style() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset password", for: .normal)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
