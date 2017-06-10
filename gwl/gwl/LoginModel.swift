//
//  LoginModel.swift
//  gwl
//
//  Created by Josh Marketis on 03/06/2017.
//  Copyright © 2017 Clidus.com. All rights reserved.
//

import Foundation

class LoginModel {
    // TODO: relocate this
    var domain: String = "http://www.gwl.com"
    
    func login(username: String, password: String) {
        let url = URL(string: domain + "/api/login")
        let jsonDict = ["username": username, "password": password]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        
        var request = URLRequest(url: url!)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                print(json["success"] as! Bool)
            } catch let error as NSError {
                print("Error:")
                print(error)
            }
        }).resume()
    }
}
