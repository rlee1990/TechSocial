//
//  ViewController.swift
//  TechSocial
//
//  Created by rickey lee on 1/25/17.
//  Copyright © 2017 rickey lee. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
            print("Rickey: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("Rickey: User cancelled Facebook authentication")
            } else {
                print("Rickey: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Rickey: Unable to authenticate with Firebase - \(error)")
            } else {
                print("Rickey: Successfully authenticated with Firebase")
            }
        })
    }

}

