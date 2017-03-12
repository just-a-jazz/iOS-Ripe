//
//  LoginViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoIconView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeIconView()
        
        customizeTextField()
    }
    
    func customizeIconView() {
        logoIconView.layer.cornerRadius = logoIconView.bounds.size.width / 2
        logoIconView.layer.masksToBounds = true
    }
    
    func customizeTextField() {
        usernameField.addBottomBorder()
        usernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.init(white: 40, alpha: 0.6)])
        usernameField.autocapitalizationType = UITextAutocapitalizationType.sentences
        usernameField.returnKeyType = .next
        
        passwordField.addBottomBorder()
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.init(white: 40, alpha: 0.6)])
        passwordField.autocapitalizationType = UITextAutocapitalizationType.none
        passwordField.returnKeyType = .done
    }
    
    // MARK: - Actions
    
    @IBAction func LoginUser(_ sender: UIButton) {
        performSegue(withIdentifier: "Login User", sender: self)
    }
    
    @IBAction func unwindLogoutUser(_ sender: UIStoryboardSegue) {
        
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
