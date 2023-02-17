//
//  PasswordCriteriaView.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-10.
//

import UIKit

class PasswordCriteriaView: UIView {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let label = UILabel()
    
    private let checkmarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    private let xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    private let circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                imageView.image = checkmarkImage
            } else {
                imageView.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet = false
        imageView.image = circleImage
    }

    init(text: String) {
        super.init(frame: .zero)
        
        label.text = text
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200, height: 40)
//    }
}

extension PasswordCriteriaView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = circleImage
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = .secondaryLabel
    }
    
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
        // StackView Constraints
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        // ImageView Constraints
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
        
        // CHCR
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}

// MARK: Tests
extension PasswordCriteriaView {
    var isCheckMarkImage: Bool {
        return imageView.image == checkmarkImage
    }

    var isXmarkImage: Bool {
        return imageView.image == xmarkImage
    }

    var isResetImage: Bool {
        return imageView.image == circleImage
    }
}
