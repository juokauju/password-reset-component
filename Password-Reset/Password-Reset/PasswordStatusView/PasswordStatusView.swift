//
//  PasswordStatusView.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-09.
//

import UIKit

class PasswordStatusView: UIView {
    
    private let stackView = UIStackView()
    
    let lengthCriteriaView = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    private let uppercaseCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    private let lowerCaseCriteriaView = PasswordCriteriaView(text: "lowercase (a-z)")
    private let digitCriteriaView = PasswordCriteriaView(text: "digit (0-9)")
    private let specialCharacterCriteriaView = PasswordCriteriaView(text: "special character (e.g. !@#$%^)")

    private let criteriaLabel = UILabel()
    
    // Used to determine if we reset criteria back to empty state (⚪️).
    var shouldResetCriteria: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 220)
    }
}

extension PasswordStatusView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        layer.cornerRadius = 5
        clipsToBounds = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalCentering
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowerCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        criteriaLabel.translatesAutoresizingMaskIntoConstraints = false
        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
    }
    
    private func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criteriaLabel)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
    
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        boldTextAttributes[.foregroundColor] = UIColor.label

        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))

        return attrText
    }
}

// MARK: Actions
extension PasswordStatusView {
    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)
        
        if shouldResetCriteria {
            // Inline validation (✅ or ⚪️)
            lengthAndNoSpaceMet
                ? lengthCriteriaView.isCriteriaMet = true
                : lengthCriteriaView.reset()
            
            uppercaseMet
                ? uppercaseCriteriaView.isCriteriaMet = true
                : uppercaseCriteriaView.reset()
            
            lowercaseMet
                ? lowerCaseCriteriaView.isCriteriaMet = true
                : lowerCaseCriteriaView.reset()

            digitMet
                ? digitCriteriaView.isCriteriaMet = true
                : digitCriteriaView.reset()
            
            specialCharacterMet
                ? specialCharacterCriteriaView.isCriteriaMet = true
                : specialCharacterCriteriaView.reset()
        } else {
            // Focus lost (✅ or ❌)
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            uppercaseCriteriaView.isCriteriaMet = uppercaseMet
            lowerCaseCriteriaView.isCriteriaMet = lowercaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharacterMet
        }
    }
    
    func validate(_ text: String) -> Bool {
        let metCriteria = otherCriteriasMet(text)
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        
        if lengthAndNoSpaceMet && metCriteria {
            return true
        }
        
        return false
    }
    
    func reset() {
        lengthCriteriaView.reset()
        uppercaseCriteriaView.reset()
        lowerCaseCriteriaView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
    
    func otherCriteriasMet(_ text: String) -> Bool {
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)

        let checkable = [uppercaseMet, lowercaseMet, digitMet, specialCharacterMet]
        let metCriteria = checkable.filter { $0 }
        
        return metCriteria.count >= 3
    }
}

