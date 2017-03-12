# Ripe

## Summary
Ripe is a smart, all-in-one POS solution for small grocers. The Ripe iOS app combines an intuitive item select menu, support for Bluetooth barcode scanning, image recognition and Square checkout to provide a quick and simple checkout experience.

## Motivation
Many modern grocers and other retailers are switching from legacy, stationary checkout machines to flexible, mobile solutions.

The Ripe app allows a cashier to quickly build the customers order and take payment entirely through the app. The cashier can scan barcoded items with the optional Bluetooth scanner, select produce items using the visual selection menu, and in the case of hard to identify fruits or vegetables, use Ripe image recognition to obtain the item code.

The Ripe app integrates with the Square merchant API for fast and secure payment processing.


### Working with FruitList.json
All *produce* objects in the JSON array have the following attributes:
- name: Name of fruit (use to show on UI).
- price: Price of fruit (if isWeighted, per 100g).
- image: Image of fruit.
- isWeighted: If true, the produce object is weighed to get the price (price*weight). If false, the produce object's price can be determined by quantity (price*quantity).
- category (optional): If category is not stated, the produce item's category will default to the name.

## Contributors
Ali Siddiqui, Matthew Paletta, William Grosset, Jordan McKinney
