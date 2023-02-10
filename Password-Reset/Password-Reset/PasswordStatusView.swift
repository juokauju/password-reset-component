//
//  PasswordStatusView.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-09.
//

import UIKit

class PasswordStatusView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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

extension PasswordStatusView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        
    }
}

