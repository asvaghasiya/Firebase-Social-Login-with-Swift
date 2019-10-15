//
//  Extension.swift
//  SocialLoginWithFirebase
//
//  Created by Artoon Solutions on 11/10/2019.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import TwitterKit
import GoogleSignIn
import FBSDKLoginKit



extension ViewController : GIDSignInDelegate
{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?)
    {
        // ...
        
        if error != nil
        {
            // ...
            print("Error From Google Sign in::::",error ?? "")
            return
        }
        print("Sucessfully logIn to google:::", user ?? "")
        guard let idToken = user.authentication.idToken else { return }
        guard let accessToken = user.authentication.accessToken else { return }
        let credential  = GoogleAuthProvider.credential(withIDToken: idToken,
                                                        accessToken: accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil
            {
                print("Failed to Create Firebase user  With Google Account::::", error ?? "")
            }
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        // ...
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        print("disconnect")
    }
}

//FbLogin Delegate
extension ViewController: LoginButtonDelegate
{
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?)
    {
        if error != nil
        {
            return
        }
        showLoginData()
    }
    
    func showLoginData()
    {
        let accessToken = AccessToken.current
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
       
        let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil
            {
                print("Somthing Went Wrong :::::", error?.localizedDescription ?? "")
                return
            }
            print("Sucessfully log in with FB user...", user?.user.uid ?? "")
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        
    }
    func loginButtonDidLogOut(_ loginButton: FBLoginButton)
    {
        print("Did LogOut of Facebook")
    }
}
