![logo](Designs/logo.png) Ripe

## Overview

### Summary
Ripe is a smart, all-in-one POS solution for small grocers. The Ripe iOS app combines an intuitive item select menu, support for Bluetooth barcode scanning, image recognition and Square checkout to provide a quick and simple checkout experience.

### Motivation & Functionality
Many modern grocers and other retailers are switching from legacy, stationary checkout machines to flexible, mobile solutions.

The Ripe app allows a cashier to quickly build the customers order and take payment entirely through the app. The cashier can scan barcoded items with the optional Bluetooth scanner, select produce items using the visual selection menu, and in the case of hard to identify fruits or vegetables, use Ripe image recognition to obtain the item code.

The Ripe app integrates with the Square merchant API for fast and secure payment processing.

## Tech

### Neural Net
We used a neural network for the image recognition portion of the app.

### Swift Classes
* **LoginViewController**: Handles user authentication and landing page for app
* **ProductListNavigation**: Holds header and displays ProductListCollectionViewController
* **CartTableNavigation**: Holds header and displays CartTableViewController
* **CartTableViewController**: Shopping cart for selected items to buy
* **CartTableViewCell**: <not sure>
* **ChildrenItemViewController**: <not sure>
* **ProductListCollectionViewController**: Categories for produce items
* **ProductListCollectionViewCell**: <not sure>
* **AddToCartViewController**: Modify weight or quantity of produce item
* **CheckoutViewController**: Handles user payment and generates a receipt
* **SelectionViewController**: Handles shared UI elements between ProductListNavigation and CartTableNavigation
* **SelectionPageViewController**: Controls screen interaction between ProductListNavigation and CartTableNavigation

## What's Next
* Train neural net on large range of fruits, vegetables, etc
* Add support for barcode scanning via camera
* Provide shopping cart review screen after tapping 'checkout'
* Add support for Bluetooth scale

## Contributors & Past Experience
Ali Siddiqui:

Matthew Paletta:

William Grosset: Some experience with Swift 2.0

Jordan McKinney: Some experience with Machine Learning
