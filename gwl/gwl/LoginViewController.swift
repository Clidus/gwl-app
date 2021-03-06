//
//  ViewController.swift
//  gwl
//
//  Created by Josh Marketis on 14/05/2017.
//  Copyright © 2017 Clidus.com. All rights reserved.
//

import UIKit
import PureLayout

class LoginViewController: UIViewController, LoginDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var loginView: LoginView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView = LoginView(frame: CGRect.zero)
        loginView.delegate = self
        self.view.addSubview(loginView)
        
        // AutoLayout
        loginView.autoPinEdgesToSuperviewEdges(with: .zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didPressLoginButton(username: String, password: String) {
        let loginModel = LoginModel()
        
        if(!loginModel.saveStringToKeyChain(key: "Password", string: password)) {
            print("Failed to save password to KeyChain")
        }
        
        loginModel.login(username: username, password: password) { (error) in
            DispatchQueue.main.async {
                if(error == nil) {
                    // remove self
                    self.appDelegate.navController.popViewController(animated: true)
                    
                    // display navigation
                    self.appDelegate.navController.setNavigationBarHidden(false, animated: false)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}

