//
//  LoginViewController.swift
//  Twitter
//
//  Created by Eddie Donovan on 3/10/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //remembers if user is already logged in, if so, performs segue
    override func viewDidAppear(_ animated: Bool) {
        if(UserDefaults.standard.bool(forKey: "userLoggedIn") == true){
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let loginURL = "https://api.twitter.com/oauth/request_token" //twitter api url for login
        
        TwitterAPICaller.client?.login(url: loginURL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not login")
        }) //calls the login function which requires a loginURL to twitter api's login, needs a condition for success which goes to home screen, and a condition for failure which prints couldn't login
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
