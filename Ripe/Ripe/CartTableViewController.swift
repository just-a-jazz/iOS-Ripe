//
//  CartTableViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit
import SwiftyJSON

class CartTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var checkoutButton: UIButton!
    
    var produceList = [Produce]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTableView()
        loadData()
    }
    
    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.produceList = self.getProduce()
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
            }
        }
    }
    
    func initializeTableView() {
        // Set up delegates
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        // Set up appearance
        cartTableView.tableFooterView = UIView()
        cartTableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0)
    }
    
    // MARK: - Table view data
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemIdentifier", for: indexPath) as! CartTableViewCell
        
        let primaryColor = UIColor(red: 245/255, green: 165/255, blue: 35/255, alpha: 1)
        
        // Cell properties
        let image = UIImage(named: produceList[indexPath.row].image)
        cell.produceImageView.image = image
        cell.produceNameLabel.text = "\(produceList[indexPath.row].name!)"
        cell.produceAmountLabel.text = "\(produceList[indexPath.row].price!)"
        cell.produceDollarLabel.text = "\(produceList[indexPath.row].price!)"
        
        // Cell appearance
        cell.produceImageView.layer.masksToBounds = true
        cell.produceImageView.layer.cornerRadius = cell.produceImageView.frame.height / 2
        cell.produceImageView.layer.borderWidth = 2
        cell.produceImageView.layer.borderColor = primaryColor.cgColor
        
        return cell
    }
    
    // Go to the select product to update the selected product
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Edit Product", sender: produceList[indexPath.row])
    }
    
    
    // MARK: - Actions
    
    @IBAction func CheckoutCart(_ sender: UIButton) {
        performSegue(withIdentifier: "Buy", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit Product" {
            if let vcDest = segue.destination as? AddToCartViewController {
                let food = sender as! Produce
                vcDest.imageToLoad = UIImage(named: food.image)
                vcDest.nameToLoad = food.name
                vcDest.priceToLoad = food.price
            }
        }
    }
    
    func getProduce()->[Produce] {
        let path = Bundle.main.path(forResource: "ProduceList", ofType: "json")
        let jsonData = NSData(contentsOfFile:path!)
        let json = JSON(data: jsonData! as Data)
        return JSONToProduce(json: json)
    }
    
    func JSONToProduce(json: JSON)->[Produce] {
        var produceArr = [Produce]()
        
        for (key, subJson) in json {
            print(key)
            let produce = getItem(item: subJson)
            produceArr.append(produce)
        }
        
        produceArr.sorted(by: {$0.name < $1.name})
        
        return produceArr
        
    }
    
    private func getItem(item: JSON)->Produce {
        let produce = Produce()
        
        produce.name = item["name"].stringValue
        produce.image = item["image"].stringValue
        
        produce.cover = item["cover"].stringValue
        
        
        produce.price = item["price"].doubleValue
        
        
        
        produce.isWeighted = item["weighted"].boolValue
        
        
        if let category = item["category"].arrayValue as? [JSON] {
            for child in category {
                let kid = getItem(item: child)
                produce.children?.append(kid)
            }
            
            produce.children?.sorted(by: {$0.name < $1.name})
        }
        
        return produce
    }
    
}
