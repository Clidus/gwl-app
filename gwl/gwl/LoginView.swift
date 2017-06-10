//
//  LoginView.swift
//  gwl
//
//  Created by Josh Marketis on 21/05/2017.
//  Copyright © 2017 Clidus.com. All rights reserved.
//

import UIKit

protocol LoginDelegate {
    func didPressLoginButton(username: String, password: String)
}

class LoginView: UIView {
    var delegate:LoginDelegate!
    
    var shouldSetupConstraints = true
    
    var imageView: UIImageView!
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        // image
        imageView = UIImageView(image: UIImage(named: "gwl-logo.png"))
        self.addSubview(imageView)
        
        // email
        emailLabel = UILabel(frame: .zero)
        emailLabel.text = "Email:"
        self.addSubview(emailLabel)
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.borderStyle = UITextBorderStyle.roundedRect
        emailTextField.autocorrectionType = UITextAutocorrectionType.no
        emailTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        emailTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        self.addSubview(emailTextField)
        
        // password
        passwordLabel = UILabel(frame: .zero)
        passwordLabel.text = "Password:"
        self.addSubview(passwordLabel)
        
        passwordTextField = UITextField(frame: .zero)
        passwordTextField.borderStyle = UITextBorderStyle.roundedRect
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        passwordTextField.isSecureTextEntry = true
        self.addSubview(passwordTextField)
        
        // button
        loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonPress), for: .touchUpInside)
        self.addSubview(loginButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            let topMargin = CGFloat(100)
            let sideMargin = CGFloat(20)
            let sectionMargin = CGFloat(20)
            let labelMargin = CGFloat(5)
            let textFieldHeight = CGFloat(40)
            
            // image
            imageView.autoPinEdge(toSuperviewEdge: .top, withInset: topMargin)
            imageView.autoAlignAxis(toSuperviewAxis: .vertical)
            
            // email
            emailLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: sectionMargin)
            emailLabel.autoPinEdge(toSuperviewEdge: .left, withInset: sideMargin)
            
            emailTextField.autoSetDimension(.height, toSize: textFieldHeight)
            emailTextField.autoPinEdge(.top, to: .bottom, of: emailLabel, withOffset: labelMargin)
            emailTextField.autoPinEdge(toSuperviewEdge: .left, withInset: sideMargin)
            emailTextField.autoPinEdge(toSuperviewEdge: .right, withInset: sideMargin)
            
            // password
            passwordLabel.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: sectionMargin)
            passwordLabel.autoPinEdge(toSuperviewEdge: .left, withInset: sideMargin)
            
            passwordTextField.autoSetDimension(.height, toSize: textFieldHeight)
            passwordTextField.autoPinEdge(.top, to: .bottom, of: passwordLabel, withOffset: labelMargin)
            passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: sideMargin)
            passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: sideMargin)
            
            // button
            loginButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: sectionMargin)
            loginButton.autoAlignAxis(toSuperviewAxis: .vertical)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func loginButtonPress(button: UIButton) {
        delegate.didPressLoginButton(username: emailTextField.text!, password: passwordTextField.text!)
    }
}
