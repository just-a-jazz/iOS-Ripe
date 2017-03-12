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

class ProductListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var products: [Produce] = [Produce]()
    var predictLabel: String?
    
    var selected = -1
    
    @IBOutlet weak var productListCollectionView: UICollectionView!
    @IBOutlet weak var recognizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupCollectionView()
        loadData()
    }
    
    func setupCollectionView() {
        productListCollectionView.delegate = self
        productListCollectionView.dataSource = self
        productListCollectionView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0)
    }
    
    func loadData() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.products = self.getProduce()
            DispatchQueue.main.async {
                self.productListCollectionView?.reloadData()
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // get taken picture as UIImage
        let uiImg = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let network = Network()
        predictLabel = network.getPrediction(image: uiImg)
        
        dismiss(animated: true, completion: ({
            self.performSegue(withIdentifier: "Add Cart Item", sender: self)
        }))
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductListCollectionViewCell
        
        let produce = products[indexPath.row]
        
        // Configure the cell
        cell.ProduceImage.image = UIImage(named: produce.image)
        cell.ProduceLabel.text = produce.name
        
        let primaryColor = UIColor(red: 245/255, green: 165/255, blue: 35/255, alpha: 1)
        
        // Change produce image
        cell.ProduceImage.layer.masksToBounds = true
        cell.ProduceImage.layer.cornerRadius = cell.ProduceImage.layer.frame.height / 2
        cell.ProduceImage.layer.borderWidth = 2
        cell.ProduceImage.layer.borderColor = primaryColor.cgColor
        
        
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
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (products[indexPath.row].children?.isEmpty)! {
            performSegue(withIdentifier: "Add Cart Item", sender: self)
        } else {
            
            selected = indexPath.row
            
            performSegue(withIdentifier: "Show Children", sender: self)
        }
        
        
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
    
    
    @IBAction func recognizeImage(_ sender: UIButton) {
        let picker = UIImagePickerController()
        
        // set the picker to camera so the user can take an image
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.camera
        
        // call the camera
        present(picker, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? SubViewController {
            destination.categoryName = products[selected].name
            destination.coverPhoto = products[selected].cover
            
            destination.products = products[selected].children
        }
        
        if let destination = segue.destination as? AddToCartViewController {
            if selected == -1 {
                selected = findSelected()
            }
            
            destination.priceToLoad = products[selected].price
            destination.imageToLoad = UIImage(named: products[selected].image)
            destination.nameToLoad = self.predictLabel!
        }
    }
    
    func findSelected() -> Int {
        
        for i in 0..<products.count {
            print(predictLabel)
            if predictLabel == products[i].name.lowercased() {
                return i
            }
        }
        return Int(arc4random_uniform(UInt32(products.count)))
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
