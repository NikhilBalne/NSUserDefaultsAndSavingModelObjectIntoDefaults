//
//  LoginVC.swift
//  NSUserDefaults
//
//  Created by iHub on 19/11/19.
//  Copyright © 2019 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.bool(forKey: "USERLOGGEDIN") == true {
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVC, animated: false)
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let userName = userNameTextField.text!
        let passWord = passwordTextField.text!
        
        let loginUrl = "/doctorConsultation/doctorLogin"
        let methodType = "POST" //as you want
        let params:[String:String] = ["username": userName,"password":passWord]
        
        NetworkingClient.networkingClient.excuteServiceCall(url:constants.baseUrl+loginUrl, method:methodType, controller:self, parameters:params){ response in
            
            if response.response?.statusCode == 200 {
                print("StatusCode:\(response.response!.statusCode)")
                
                do {
                    
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(LoginResponseModel.self, from: response.data!)
                    
                    let userDefaults = UserDefaults.standard
                    userDefaults.set(true, forKey: "USERLOGGEDIN")
                    
                    if let encoded = try? JSONEncoder().encode(results) {
                        UserDefaults.standard.set(encoded, forKey: "loginResponse")
                    }
                    
                    userDefaults.synchronize()
                    
                    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(homeVC, animated: true)
                    
                } catch let error {
                    print("ErrorDescription:",error.localizedDescription)
                }
                
            } else if response.response?.statusCode == 800 {
                print("StatusCode:\(response.response!.statusCode)")

            }
        }
    }
}
