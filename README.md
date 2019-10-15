#  Social Login With Firebase Tutorial

Introduction
------------

- [Read more about Firebase Authentication](https://firebase.google.com/docs/auth/)

Getting Started
---------------

- [Add Firebase to your iOS Project](https://firebase.google.com/docs/ios/setup).


    ### Facebook Login Setup
    - Go to the [Facebook Developers Site](https://developers.facebook.com) and follow all
      instructions to set up a new iOS app. When asked for a bundle ID, use
      `com.google.firebase.quickstart.AuthenticationExample`.
    - Go to the [Firebase Console](https://console.firebase.google.com) and navigate to your project:
      - Select the **Auth** panel and then click the **Sign In Method** tab.
      - Click **Facebook** and turn on the **Enable** switch, then click **Save**.
      - Enter your Facebook **App Id** and **App Secret** and click **Save**.
    - Open your regular `Info.plist` and replace the value of the `FacebookAppID` with the ID of the
      Facebook app you just created, e.g 124567. Save that file.
    - In the *Info* tab of your target settings add a *URL Type* with a *URL Scheme* of 'fb' + the ID
      of your Facebook app, e.g. fb1234567.
    - Run the app on your device or simulator.
        - Tap on "Login With FaceBook".
    
    ### Google Sign In Setup
    - Go to the [Firebase Console](https://console.firebase.google.com) and navigate to your project:
      - Select the **Auth** panel and then click the **Sign In Method** tab.
      - Click **Google** and turn on the **Enable** switch, then click **Save**.
    - In Xcode, [add a custom URL scheme for your reversed client ID](https://developers.google.com/identity/sign-in/ios/start-integrating).
      - You can find this in the `GoogleService-Info.plist`
    - Run the app on your device or simulator.
        - Tap on "Login With Google".
        
        ### Twitter Login Setup
    - [Register your app](https://apps.twitter.com) as a developer application on Twitter and get your
      app's OAuth API key and API secret.
    - Go to the [Firebase Console](https://console.firebase.google.com) and navigate to your project:
      - Select the **Auth** panel and then click the **Sign In Method** tab.
      - Click **Twitter** and turn on the **Enable** switch, then click **Save**.
      - Enter your Twitter **API Key** and **App Secret** and click **Save**.
      - Make sure your Firebase OAuth redirect URI (e.g. my-app-12345.firebaseapp.com/__/auth/handler) is set as your  
        Authorization callback URL in your app's settings page on your [Twitter app's config](https://apps.twitter.com).
    - Run the app on your device or simulator.
        - Tap on "Login With Twitter".
        
        ### Email/Password Setup
        - Go to the [Firebase Console](https://console.firebase.google.com) and navigate to your project:
          - Select the **Auth** panel and then click the **Sign In Method** tab.
          - Click **Email/Password** and turn on the **Enable** switch, then click **Save**.
        - Run the app on your device or simulator.
            - Tap on "Login With Email/Password".
            

    ### PhoneNumber Setup
    - Go to the [Firebase Console](https://console.firebase.google.com) and navigate to your project:
             - Select the **Auth** panel and then click the **Sign In Method** tab.
             - Click **Phone** and turn on the **Enable** switch, then click **Save**.
           - Run the app on your device or simulator.
           - Tap on "Login With Phone". 


### request signin to firebase

    Auth.auth().signIn(with: credential) 
    { (user, error) in
        if error != nil
        {
            print("Somthing Went Wrong :::::", error?.localizedDescription ?? "")
            return
        }
        print("Sucessfully log in with FB user...", user?.user.uid ?? "")
    }
    
