//
//  ViewController.swift
//  SocialLoginWithFirebase
//
//  Created by Artoon Solutions on 10/10/2019.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import TwitterKit
import GoogleSignIn
import FBSDKLoginKit
class ViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        //checkUSerLogInOrNot
        CheckIfUserLogIn()
        
        //set FB Button
        SetFBLoginButton()
        
        //Set Google Button
        SetGoogleSignInButton()
        
        //Set Twitter Button
        SetTwitterButton()
        
        //SetEmailPassword Button
        setEmailPasswordButton()
        
        //Set PhoneNumber Button
        SetPhoneNumberButton()
        
    }
    
    
    func CheckIfUserLogIn() {
        if Auth.auth().currentUser?.uid == nil
        {
            perform(#selector(handleLogout), with: nil , afterDelay: 0)
            
        }
        else
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    @objc func handleLogout()
    {
        do {
            try Auth.auth().signOut()
        } catch let logouterror {
            print("LogoutError", logouterror )
        }
    }
    
    
    
    
//MARK: -FaceBook
    // FB Login Button
    fileprivate func SetFBLoginButton()
    {
        let FBloginbutton = FBLoginButton()
        view.addSubview(FBloginbutton)
        FBloginbutton.frame = CGRect(x: 50, y: 100, width: view.frame.width - 100, height: 50)
        FBloginbutton.delegate = self
        FBloginbutton.permissions = ["email", "public_profile"]
    }
    
    
//MARK: -Google
    //Google SignIn Button
    fileprivate func SetGoogleSignInButton()
    {
        let GoogleBtn1 = GIDSignInButton()
        view.addSubview(GoogleBtn1)
        GoogleBtn1.frame = CGRect(x: 50, y: 200, width: view.frame.width - 100, height: 50)
        GIDSignIn.sharedInstance()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    
//MARK: -Twitter
    //Twitter SignIn Button
    fileprivate func SetTwitterButton()
    {
        let TwitterButton  = TWTRLogInButton
        { (session, error) in
            if error != nil
            {
                print("Errror with twitter::",error)
                return
                
                
            }
            guard let  token = session?.authToken else { return }
            guard let secret = session?.authTokenSecret else { return }
            let credentials = TwitterAuthProvider.credential(withToken: token, secret: secret)
            Auth.auth().signIn(with: credentials, completion: { (user, error) in
                if error != nil
                {
                    print("Errror Credentials with twitter::",error)
                    return
                }
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
                self.navigationController?.pushViewController(newViewController, animated: true)
                
            })
        }
        view.addSubview(TwitterButton)
        TwitterButton.frame = CGRect(x: 50, y: 300
            , width: view.frame.width - 100, height: 50)
    }
//MARK: -Email/Password
    fileprivate func setEmailPasswordButton()
    {
        let EmailPassButton = UIButton()
        EmailPassButton.frame = CGRect(x: 50, y: 400, width: view.frame.width - 100, height: 50)
        EmailPassButton.backgroundColor = UIColor.orange
        EmailPassButton.setTitle("Login With Email/Password", for: .normal)
        EmailPassButton.titleLabel?.font = EmailPassButton.titleLabel?.font.withSize(15)
        EmailPassButton.addTarget(self, action: #selector(OnEmailPassButton), for: .touchUpInside)
        view.addSubview(EmailPassButton)
    }
    @objc func OnEmailPassButton()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "EmailPasswordLogin") as! EmailPasswordLogin
        
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
    
//MARK: -PhoneNumber
    //Phone Number Button
    fileprivate func SetPhoneNumberButton()
    {
        let PhoneVerify = UIButton()
        PhoneVerify.frame = CGRect(x: 50, y: 500, width: view.frame.width - 100, height: 50)
        PhoneVerify.backgroundColor = UIColor.black
        PhoneVerify.setTitle("Login With Phone", for: .normal)
        PhoneVerify.titleLabel?.font = PhoneVerify.titleLabel?.font.withSize(15)
        PhoneVerify.addTarget(self, action: #selector(OnPhoneVerifyBtn), for: .touchUpInside)
        view.addSubview(PhoneVerify)
    }
    @objc func OnPhoneVerifyBtn()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PhoneVerification") as! PhoneVerification
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
