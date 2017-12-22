# Cabify's checkout process

Hello **Cabify team**, this is my solution for the [rubyChallenge](https://github.com/cabify/rubyChallenge),
the architecture was designed with an OPP approach so that new functionalities can be easily added. Below some notes explaining what does each class, how they interact with each other and some additional considerations.

## Product

Product class allows create individual instances with  the attributes ```code```, ```name``` and ```price```,
all the the info necessary to add a new product to the ```Store``` class.

## Store

This class groups instances of ```Product``` class, with two private methods, ```add_product``` method that receives ```code```, ```name``` and ```price``` like parameters and ```load_products``` method, to create all products inside the ```Store``` instance.  For a future improve, ```load_products``` method could receive a external file like a data base to load a big quantity of products.

## Order Item

Instances of ```OrderItem``` class contain the following attributes: ```code``` to identify the product
associated, it's a reader attribute that can't change after created, and ``` quantity```, ```unit_price```
and``` discount``` like attributes accessor , which change according to the number of scanned products
and discounts available.

## Order

Order class stores instances of ```OrderItem``` in the ```items``` variable, through the ```add_item``` method, each item has an attribute ```quantity``` to accumulate the same kind of products, this design facilitates later calculations in ```Checkout```.

## Rules

This class allows instantiate all available rules at the same time with the ```load_rules``` method
(for future improvements, these rules could come from an external file to load a large number of
rules). It also has the ```apply_rules``` method that receives a hash of ```items``` to apply the available  ```rules```.

Currently there are two rules, both receives a ```code``` attribute to relate the instance with the product, and each rule has the ```apply``` method that is different depending on the rule. Following this pattern is pretty easy add future rules.

These are the available rules:

  * BuyTwoGetOneFreeRule:  This rule ```apply``` a discount equivalent to one free by each two units.
  * BulkPurchasesRule:  In addition to the ```code``` this rule receives ```quantity``` and           ```discount_rate```, that allows ```apply``` a bulk discount, where by each X units```(quantity)```
    receives a Y% ```(discont_rate)``` of discount on the ```unit_price```.

## Checkout

This is the Main Class to interact with the app, a new ```Checkout``` instance receive ```pricing_rules``` like parameter that contents all the discount available rules. Also has two main methods, the first one is ```scan```, that allows register a new product in in the order, the second one is ```total``` to get the total to pay on your order, also the class allows call two instance variables , ```store``` to know the available products and ```order``` to check the items scanned.

## Classes diagram

![co_diagram_class](https://image.ibb.co/k7VmAR/co_diagram_class.png)

## Tests

Each class is tested with unit tests using **Rspec** like testing framework, to run the tests, first remember install the gem from your terminal with ```gem install rspec```, then from Project's root
run ```rspec spec``` to run all the tests at same time, or ```rspec spec/name_class_spec.rb``` to run a specific test.

## Checkout CLI

To interact with the app, run ```ruby co_cli.rb```.
