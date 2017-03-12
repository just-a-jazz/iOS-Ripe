//
//  CartTableViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class CartTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var CartTableView: UITableView!
    @IBOutlet weak var CheckoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CartTableView.delegate = self
        CartTableView.dataSource = self
        
        //navigationController?.navigationBar.tintColor = UIColor.blue
        //navigationController?.navigationBar.backgroundColor = UIColor.orange
        self.title = "Cart"
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        customizeUIButton()
    }
    
    
    func customizeUIButton() {
        CheckoutButton.backgroundColor = UIColor.orange
        CheckoutButton.tintColor = UIColor.white
        CheckoutButton.layer.masksToBounds = true
        CheckoutButton.layer.cornerRadius = CheckoutButton.frame.height / 2
        CheckoutButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data 
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemIdentifier", for: indexPath) as! CartTableViewCell

        // Configure the cell...

        return cell
    }

    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // Go to the select product to update the selected product
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Select Product", sender: self)
    }
    
    
    // MARK: - Actions
    
    @IBAction func CheckoutCart(_ sender: UIButton) {
        performSegue(withIdentifier: "Checkout Cart", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
