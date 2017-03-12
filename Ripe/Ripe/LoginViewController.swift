//
//  LoginViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeTextField()
        customizeUIButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeUIButton() {
        loginButton.backgroundColor = UIColor.orange
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
    }
    
    func customizeTextField() {
        usernameField.addBottomBorder()
        usernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.white])
        usernameField.autocapitalizationType = UITextAutocapitalizationType.sentences
        usernameField.returnKeyType = .next
        
        passwordField.addBottomBorder()
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.white])
        passwordField.autocapitalizationType = UITextAutocapitalizationType.none
        passwordField.returnKeyType = .done
    }
    
    // MARK: - Actions
    
    @IBAction func LoginUser(_ sender: UIButton) {
        performSegue(withIdentifier: "Login User", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
