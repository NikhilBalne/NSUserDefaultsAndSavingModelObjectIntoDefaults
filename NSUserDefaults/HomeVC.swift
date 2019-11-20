//
//  HomeVC.swift
//  NSUserDefaults
//
//  Created by iHub on 19/11/19.
//  Copyright © 2019 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let savedPersonData = UserDefaults.standard.object(forKey: "loginResponse") as? Data else { return }
        guard let savedPerson = try? JSONDecoder().decode(LoginResponseModel.self, from: savedPersonData) else { return }
        
        print("\n Saved Doctor Name : \(String(describing: savedPerson.doctorName))")
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "USERLOGGEDIN")
        UserDefaults.standard.removeObject(forKey: "loginResponse")
        self.navigationController?.popViewController(animated: true)
    }
    
}
