//
//  AppDelegate.swift
//  SocialLoginWithFirebase
//
//  Created by Artoon Solutions on 10/10/2019.
//  Copyright © 2019 Artoon Solutions. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseCore
import TwitterKit
import TwitterCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        //MARK:- Enter Consumer Key and Secret Key.
        TWTRTwitter.sharedInstance().start(withConsumerKey: "Enter Here", consumerSecret: "Enter Here")
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handledF = ApplicationDelegate.shared.application(app, open: url, sourceApplication: (options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String), annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        GIDSignIn.sharedInstance()?.handle(url)
        let handledT = TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        return handledF || handledT
    }
    
}

