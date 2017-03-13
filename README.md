#Ripe
## Overview

### Summary
This iOS application was developed within **24 hours** for [HackUVic2017](http://17w.hackuvic.com/).

Ripe is a smart, all-in-one POS solution for medium sized grocery stores. The Ripe iOS app combines an intuitive item select menu with neural net powered image recognition.

### Motivation & Functionality
Many modern grocers and other retailers are switching from legacy, stationary checkout machines to flexible, mobile solutions.

Ripe allows a cashier to quickly build the customers order and take payment entirely through the app. The cashier can scan barcoded items with the optional Bluetooth scanner, select produce items using the visual selection menu, and in the case of hard to identify fruits or vegetables, use Ripe image recognition to obtain the item code.

## Technologies

### Neural Net
We used a neural network for the image recognition portion of the app. 

### Swift Classes
* **LoginViewController**: Handles user authentication and landing page for app
* **ProductListNavigation**: Holds header and displays ProductListCollectionViewController
* **CartTableNavigation**: Holds header and displays CartTableViewController
* **CartTableViewController**: Shopping cart for selected items to buy
* **CartTableViewCell**: Item object with name, image, weight, and price
* **SubViewController**: Displays sub-categories for a chosen cagetory
* **ProductListCollectionViewController**: Categories for produce items
* **ProductListCollectionViewCell**: Category object with name and image
* **AddToCartViewController**: Modify weight or quantity of produce item
* **CheckoutViewController**: Handles user payment and generates a receipt
* **SelectionViewController**: Handles shared UI elements between ProductListNavigation and CartTableNavigation
* **SelectionPageViewController**: Controls screen interaction between ProductListNavigation and CartTableNavigation

## What's Next
* Train neural net on large range of fruits, vegetables, etc
* Add support for barcode scanning via camera
* Provide Square integration after tapping 'checkout'
* Add support for Bluetooth scale

## Contributors & Past Experience
Ali Siddiqui: Moderate experience with Swift 3.0 and Machine Learning.

Matthew Paletta: Moderate experience with Swift 3.0 and Machine Learning.

William Grosset: Minimal experience with Swift 2.0.

Jordan McKinney: Some experience with Machine Learning.
