//
//  ViewControllerTests.swift
//  Password-ResetTests
//
//  Created by Justina Siaulyte on 2023-02-17.
//

import XCTest

@testable import Password_Reset

class ViewControllerTests_NewPassword_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }

    /*
     Here we trigger those criteria blocks by entering text,
     clicking the reset password button, and then checking
     the error label text for the right message.
     */
    private func buttonTapped() {
        vc.resetButtonTapped(UIButton())
    }
    
    private func errorLabelText() -> String {
        vc.newPasswordTextField.errorMessageLabel.text!
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        buttonTapped()
        
        XCTAssertEqual(errorLabelText(), "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = ">" // has a character which is not included in valid char
        buttonTapped()
        
        XCTAssertEqual(errorLabelText(), "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        buttonTapped()
        
        XCTAssertEqual(errorLabelText(), "Your password must meet the requirements below")
    }
    
    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        buttonTapped()
        
        XCTAssertEqual(errorLabelText(), "")
    }
    
}

class ViewControllerTests_Confirm_Password_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    private func buttonTapped() {
        vc.resetButtonTapped(UIButton())
    }
    
    private func errorLabelText() -> String {
        vc.newPasswordTextField.errorMessageLabel.text!
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        buttonTapped()
        
        XCTAssertEqual(errorLabelText(), "Enter your password")
    }
    
    func testPasswordsDoNitMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        
        XCTAssertEqual(errorLabelText(), "Password does not match")
    }
    
    func testPasswordMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        
        XCTAssertEqual(errorLabelText(), "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetButtonTapped(UIButton())

        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success") // Optional
    }

    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetButtonTapped(UIButton())

        XCTAssertNil(vc.alert)
    }
}
