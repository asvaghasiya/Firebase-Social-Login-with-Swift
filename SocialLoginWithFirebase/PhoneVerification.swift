//
//  PhoneVerification.swift
//  firebaseLiveChat
//
//  Created by Artoon Solutions on 07/09/19.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit
import FirebaseUI
class PhoneVerification: UIViewController
{
    var Verificationid = String()
    @IBAction func OnCancelBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var DisplyName: UITextField!
    @IBOutlet weak var PhoneNoText: UITextField!
    @IBOutlet weak var SendOtpBtn: UIButton!
    @IBAction func OnSendOtp(_ sender: Any)
    {
        if SendOtpBtn.titleLabel?.text != "Login"
        {
            guard let phoneNumber = PhoneNoText.text else {
                return
            }
            PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
                if error != nil {
                    //self.showMessagePrompt(error.localizedDescription)
                    print("error with PhoneNumber Verification", error ?? "")
                    let AlertPopup = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                    AlertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(AlertPopup, animated: true, completion: nil)
                    return
                }
                print("Successfull with phoneNumber", verificationID ?? "")
                self.PhoneNoText.text = ""
                self.PhoneNoText.placeholder = "Enter OTP"
                self.SendOtpBtn.titleLabel?.text = "Login"
                self.Verificationid = verificationID ?? ""
            }
        }
        else
        {
            guard let testVerificationCode = PhoneNoText.text else
            {
                return
            }
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: Verificationid ,
                                                                     verificationCode: testVerificationCode)
            Auth.auth().signIn(with: credential) { authData, error in
                if error != nil {
                    // Handles error
                    print("Error in login with firebase", error ?? "")
                    let AlertPopup = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                    AlertPopup.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(AlertPopup, animated: true, completion: nil)
                    return
                }
                print("Successfully login with firebase")
                print(authData?.user.phoneNumber ?? "" )
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
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

