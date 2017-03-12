//
//  LoginViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customizeUIButton() {
        
    }
    
    func customizeTextField() {
        UsernameField.backgroundColor = UIColor(colorLiteralRed: 37/255, green: 37/255, blue: 37/255, alpha: 37/255)
        UsernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        UsernameField.autocapitalizationType = UITextAutocapitalizationType.sentences
        UsernameField.returnKeyType = .next
        
        
        PasswordField.backgroundColor = UIColor(colorLiteralRed: 37/255, green: 37/255, blue: 37/255, alpha: 37/255)
        PasswordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
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
