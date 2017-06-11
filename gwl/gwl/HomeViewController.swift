//
//  ViewController.swift
//  gwl
//
//  Created by Josh Marketis on 14/05/2017.
//  Copyright © 2017 Clidus.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Gaming with Lemons";
        
        checkLogin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkLogin() {
        // check if logged in
        let loginModel = LoginModel()
        if(!loginModel.isLoggedIn()) {
            let loginViewController = LoginViewController()
            
            // hide navigation
            appDelegate.navController.setNavigationBarHidden(true, animated: false)
            
            // display login
            appDelegate.navController.pushViewController(loginViewController, animated: true)
        }
    }
}

