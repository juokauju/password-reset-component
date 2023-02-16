//
//  PasswordCriteriaTests.swift
//  Password-ResetTests
//
//  Created by Justina Siaulyte on 2023-02-16.
//

import XCTest

@testable import Password_Reset

class PasswordLengthCriteriaTests: XCTestCase {

    // Boundary conditions 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }

    func testLong() throws {
        let letter33String = "123456789012345678901234567890123"
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet(letter33String))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678"))
    }

    func testValidLong() throws {
        let letter32String = "12345678901234567890123456789012"
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet(letter32String))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("12345678"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("123 45678"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testUppercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("aa"))
    }
    
    func testLowercaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet(#"@\/!:,.#$?"#))
    }
    
    func testSpecialCharacterNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("aaA123>"))
    }
}
