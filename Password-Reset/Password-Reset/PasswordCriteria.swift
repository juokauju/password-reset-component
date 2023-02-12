//
//  PasswordCriteria.swift
//  Password-Reset
//
//  Created by Justina Siaulyte on 2023-02-12.
//

import Foundation

struct PasswordCriteria {
    
    static func lengthAndNoSpaceMet(_ text: String) -> Bool {
        lengthCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    static func lengthCriteriaMet(_ text: String) -> Bool {
        text.count >= 8 && text.count <= 32
    }
    
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
    
    static func uppercaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowercaseMet(_ text: String) -> Bool {
       return text.range(of: "[a-z]", options: .regularExpression) != nil
    }
    
    static func digitMet(_ text: String) -> Bool  {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharactersMet(_ text: String) -> Bool {
        text.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
}

