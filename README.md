# sales-tax-ruby-test

## Execute
  Run the following command to export all files from `input_data` folder to `results` folder
  ```
    $ ruby app.rb
  ```

## Problem
  ```
  Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

  When I purchase items I receive a receipt that lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

  Write an application that prints out the receipt details for these shopping baskets; this application should be written in Ruby [1] and use Rspec [2] to test inputs and the expected outputs. The output should be to standard out or CSV.

  Proper object orientated design is important. Each row in the input represents a line item of the receipt.
  ```

## Input
  ### Input 1
  ```
  Quantity, Product, Price
  1, book, 12.49
  1, music cd, 14.99
  1, chocolate bar, 0.85
  ```
  ### Input 2
  ```
  Quantity, Product, Price
  1, imported box of chocolates, 10.00
  1, imported bottle of perfume, 47.50
  ```
  ### Input 3
  ```
  Quantity, Product, Price
  1, imported bottle of perfume, 27.99
  1, bottle of perfume, 18.99
  1, packet of headache pills, 9.75
  1, box of imported chocolates, 11.25
  ```

## Output
  The output results will be exported to `results` folder with format name like `output_*.csv`

## Tests
  To run the specs:
  ```
    $ rspec
  ```
