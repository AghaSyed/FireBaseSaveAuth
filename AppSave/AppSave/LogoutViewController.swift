//
//  LogoutViewController.swift
//  AppSave
//
//  Created by Rashdan Natiq on 02/08/2017.
//  Copyright © 2017 Syed Qamar Abbas. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class LogoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    var myList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userEmailLabel.text = "Welcome " + (Auth.auth().currentUser?.email)!
        
        ref = Database.database().reference()
        handle = ref?.child("list").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String {
                self.myList.append(item)
                self.myTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        if myTextField.text != "" {
            ref?.child("list").childByAutoId().setValue(myTextField.text)
            myTextField.text = ""
        }
    }

    @IBAction func didTapLogoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "sugueLogout", sender: self)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = myList[indexPath.row]
        return cell
    }
}
