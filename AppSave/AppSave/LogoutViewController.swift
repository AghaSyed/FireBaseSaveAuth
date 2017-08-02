//
//  LogoutViewController.swift
//  AppSave
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Syed Qamar Abbas. All rights reserved.
//

import UIKit
import FirebaseAuth
class LogoutViewController: UIViewController {

    @IBOutlet weak var userEmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userEmailLabel.text = "Welcome " + (Auth.auth().currentUser?.email)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapLogoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "sugueLogout", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
