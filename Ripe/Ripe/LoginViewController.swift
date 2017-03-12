//
//  LoginViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameField: textField!
    @IBOutlet weak var PasswordField: textField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
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
        LoginButton.backgroundColor = UIColor.orange
        LoginButton.titleLabel?.textColor = UIColor.white
        LoginButton.layer.masksToBounds = true
        LoginButton.layer.cornerRadius = LoginButton.frame.height / 2
        LoginButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
    }
    
    func customizeTextField() {
        UsernameField.addBottomBorder()
        UsernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.white])
        UsernameField.autocapitalizationType = UITextAutocapitalizationType.sentences
        UsernameField.returnKeyType = .next
        
        PasswordField.addBottomBorder()
        PasswordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.white])
        PasswordField.autocapitalizationType = UITextAutocapitalizationType.none
        PasswordField.returnKeyType = .done
    }
    
    // MARK: - Actions
    
    @IBAction func LoginUser(_ sender: UIButton) {
        performSegue(withIdentifier: "Login User", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
 

}
