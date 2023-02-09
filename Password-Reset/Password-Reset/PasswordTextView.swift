//
//  PasswordTextView.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-08.
//

import UIKit

class PasswordTextView: UIView {
    
    private let stackView = UIStackView()
    private let passwordTextField = PaddedTextField()
    private let errorMessageLabel = UILabel()
    private let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Style and Layout
extension PasswordTextView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        
        stylePasswordTextField()
        styleDividerView()
        styleErrorMessageLabel()
        styleStackView()
    }
    
    private func layout() {
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(errorMessageLabel)
        addSubview(stackView)
        addStackViewConstraints()
    }
    
    private func stylePasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.enablePasswordToggle()
        passwordTextField.delegate = self
        addLockIconToPasswordTextField()
    }
    
    private func addLockIconToPasswordTextField() {
        let image = UIImage(systemName: "lock.fill")
        let imageView = UIImageView(image: image)
        passwordTextField.leftView = imageView
        passwordTextField.leftViewMode = .always
        
    }
    
    private func styleDividerView() {
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func styleErrorMessageLabel() {
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 1
        errorMessageLabel.isHidden = true
    }
    
    private func styleStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
    }
    
    private func addStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

// MARK: - TextField Delegate
extension PasswordTextView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
}

