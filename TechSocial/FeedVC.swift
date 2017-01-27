//
//  FeedVC.swift
//  TechSocial
//
//  Created by rickey lee on 1/26/17.
//  Copyright © 2017 rickey lee. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signoutBtnTapped(_ sender: Any) {
        if KeychainWrapper.standard.removeObject(forKey: KEY_UID) {
            print("Rickey: Keychain removed")
        }
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }


}
