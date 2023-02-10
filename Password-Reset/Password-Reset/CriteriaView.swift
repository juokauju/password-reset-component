//
//  CriteriaView.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-09.
//

import UIKit

class CriteriaView: UIView {
    
    let image: UIImage
    let text: String
    private let criteriaImageView = UIImageView()
    private let textLabel = UILabel()
    
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}

extension CriteriaView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        criteriaImageView.translatesAutoresizingMaskIntoConstraints = false
        criteriaImageView.image = image
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .secondaryLabel
        textLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        textLabel.text = text
    }
    
    private func layout() {
        addSubview(criteriaImageView)
        addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            criteriaImageView.topAnchor.constraint(equalTo: topAnchor),
            criteriaImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            criteriaImageView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: criteriaImageView.trailingAnchor, constant: 8)
        ])
        
        criteriaImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}
