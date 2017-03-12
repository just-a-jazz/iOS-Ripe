//
//  ProductListCollectionViewController.swift
//  Ripe
//
//  Created by Matthew Paletta on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit
import SwiftyJSON

private let reuseIdentifier = "ProductListItem"

class ProductListCollectionViewController: UICollectionViewController {

    var products: [Produce]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        
    }
    
    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.products = self.getProduce()
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1//products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductListCollectionViewCell
    
        // Configure the cell
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Add Cart Item", sender: self)
    }
    

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
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
        
        if let cover = item["cover"].stringValue as? String {
            produce.cover = cover
        }
        
        if let price = item["price"].doubleValue as? Double {
            produce.price = price
        }
        
        if let weighted = item["weighted"].boolValue as? Bool {
            produce.isWeighted = weighted
        }
        
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
