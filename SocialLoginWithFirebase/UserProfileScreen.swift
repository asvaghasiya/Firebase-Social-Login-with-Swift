//
//  UserProfileScreen.swift
//  firebaseLiveChat
//
//  Created by Artoon Solutions on 09/09/19.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit
import FirebaseUI
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit
class UserProfileScreen: UIViewController
{
    @IBAction func OnLogoutBtn(_ sender: Any)
    {
        do {
            try Auth.auth().signOut()
            if GIDSignIn.sharedInstance()?.currentUser != nil
            {
                print("googlesignin:::",GIDSignIn.sharedInstance()?.currentUser)
                GIDSignIn.sharedInstance()?.disconnect()
            }
            if AccessToken.current != nil
            {
                print("Access",AccessToken.current)
                let login = LoginManager()
                login.logOut()
                
            }
            
        } catch let logouterror {
            print("LogoutError", logouterror )
        }
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(OnLogoutBtn(_:)))
        let welcome = UILabel()
        welcome.text = "Welcome To Social Login With Firebase"
        self.view.addSubview(welcome)
    }
}
