//
//  ViewController.swift
//  AppSave
//
//  Created by Syed Qamar Abbas on 01/08/2017.
//  Copyright © 2017 Syed Qamar Abbas. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet var segmentButton: UISegmentedControl!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSegmentedControl(_ sender: UISegmentedControl) {
        if segmentButton.selectedSegmentIndex == 0 {
            let image1 = UIImage(named: "login") as UIImage!
            self.saveButton.setImage(image1, for: .normal)
            
        } else {
            let image1 = UIImage(named: "singUp") as UIImage!
            self.saveButton.setImage(image1, for: .normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            if segmentButton.selectedSegmentIndex == 0 {   // login
                Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        
                        //Print into the console if successfully logged in
                        print("You have successfully logged in")
                        
                       self.performSegue(withIdentifier: "sugue", sender: self)
                      //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                       // self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        
                        //Tells the user that there is an error and then gets firebase to tell them the error
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            } else { // singup
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                       self.performSegue(withIdentifier: "sugue", sender: self)
                        // let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        //   self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
            
    }
  

    }
}

