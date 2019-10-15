//
//  EmailPasswordLogin.swift
//  firebaseLiveChat
//
//  Created by Artoon Solutions on 03/09/19.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//
import UIKit
import Foundation
import FirebaseUI
import FirebaseAuth
class EmailPasswordLogin: UIViewController
{
    @IBAction func OnCancelBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var loginorReg: UISegmentedControl!
    @IBAction func onsegment(_ sender: Any)
    {
        if loginorReg.selectedSegmentIndex == 0
        {
            loginView.isHidden = false
            RegistrationView.isHidden = true
        }
        else
        {
            RegistrationView.isHidden = false
            loginView.isHidden = true
        }
    }
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var LoginEmailId: UITextField!
    @IBOutlet weak var LoginPassword: UITextField!
    @IBOutlet weak var EmailId: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var RegistrationView: UIView!
    
    @IBAction func OnLoginBtn(_ sender: Any)
    {
        if (sender as AnyObject).tag == 0
        {
            guard let email = LoginEmailId.text , let pass = LoginPassword.text  else {
                print("Form is Not Valid")
                return
            }
            //login with email and password in firebase
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if error != nil
                {
                    print("Failed Login with Email/Password in firebase::",error?.localizedDescription ?? "")
                    let AlertPopup = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                    AlertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(AlertPopup, animated: true, completion: nil)
                    return
                }
                self.LoginEmailId.text = ""
                self.LoginPassword.text = ""
                print("SuccessFully Login with Email/Password in firebase::")
                self.presentLoginView()
                
            }
        }
        else
        {
            guard let email = EmailId.text , let pass = Password.text , let name = Name.text else {
                print("Form is Not Valid")
                return
            }
            EmailId.text = ""
            Password.text = ""
            Name.text = ""
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if error != nil
                {
                    print("Failed Login with Email/Password in firebase::",error?.localizedDescription ?? "")
                    let AlertPopup = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                    AlertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(AlertPopup, animated: true, completion: nil)
                    return
                }
                print("SuccessFully Login with Email/Password in firebase::")
                self.presentLoginView()
                
            }
        }
        
        
        
    }
    func presentLoginView()
    {
        print(self.navigationController!.viewControllers.count)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "UserProfileScreen") as! UserProfileScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
        print(self.navigationController!.viewControllers.count)
        guard let navigationController1 = self.navigationController else { return }
        var navigationArray1 = navigationController1.viewControllers // To get all UIViewController stack as Array
        navigationArray1.remove(at: navigationArray1.count - 2) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray1
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        RegistrationView.isHidden = true
    }
}
