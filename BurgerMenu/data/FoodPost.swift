//
//  FoodPost.swift
//  BurgerMenu
//
//  Created by KsArT on 30.05.2024.
//

import UIKit

struct FoodPost {
    let name: String
    let picture: UIImage?
    let description: String
    var price: Float
    var count: Int
}

final class FoodData{
    
    static var index = -1
    
    private static var foods: [FoodPost]=[
        FoodPost(name: "Burger", 
                 picture: UIImage(named: "burger"),
                 description: "We have the biggest burgers, at the lowest price.",
                 price: 3.99, count: 100),
        FoodPost(name: "Cake", 
                 picture: UIImage(named: "cake"),
                 description: "A big piece of lemon pie.",
                 price: 1.99, count: 100),
        FoodPost(name: "Chicken", 
                 picture: UIImage(named: "chicken"),
                 description: "Big fried chicken.",
                 price: 5.99, count: 100),
        FoodPost(name: "Donut", 
                 picture: UIImage(named: "donut"),
                 description: "The most delicious and biggest donuts!",
                 price: 1.99, count: 100),
        FoodPost(name: "French-fries", 
                 picture: UIImage(named: "french-fries"),
                 description: "French fries, very tasty!",
                 price: 2.99, count: 100),
        FoodPost(name: "Hot-dog", 
                 picture: UIImage(named: "hot-dog"),
                 description: "A hot dog with a delicious smoked sausage.",
                 price: 1.99, count: 100),
        FoodPost(name: "Ice-cream", 
                 picture: UIImage(named: "ice-cream"),
                 description: "Ice cream, three scoops with three different flavors: lemon, strawberry, vanilla.",
                 price: 1.99, count: 100),
        FoodPost(name: "Japanese-food", 
                 picture: UIImage(named: "japanese-food"),
                 description: "Japanese food, several different dishes to introduce you to Japanese cuisine.",
                 price: 6.99, count: 100),
        FoodPost(name: "Kebab", 
                 picture: UIImage(named: "kebab"),
                 description: "Kebab, Nesh kebab is the most delicious, you'll lick your fingers!",
                 price: 3.99, count: 100),
        FoodPost(name: "Noodles", 
                 picture: UIImage(named: "noodles"),
                 description: "A bowl of hot noodles won't leave you hungry!",
                 price: 4.99, count: 100),
        FoodPost(name: "Pancake", 
                 picture: UIImage(named: "pancake"),
                 description: "Pancakes with blueberry jam.",
                 price: 4.99, count: 100),
        FoodPost(name: "Pizza", 
                 picture: UIImage(named: "pizza"),
                 description: "Pizza with seafood, large size.",
                 price: 2.99, count: 100),
        FoodPost(name: "Sandwich", 
                 picture: UIImage(named: "sandwich"),
                 description: "Not a big sandwich to just snack on.",
                 price: 1.49, count: 100),
        FoodPost(name: "Spaghetti", 
                 picture: UIImage(named: "spaghetti"),
                 description: "A plate of spaghetti, a hearty dinner for you!",
                 price: 1.49, count: 100),
        FoodPost(name: "Sushi", 
                 picture: UIImage(named: "sushi"),
                 description: "Large set of sushi 23 pieces.",
                 price: 7.99, count: 100),
        FoodPost(name: "Taco", 
                 picture: UIImage(named: "taco"),
                 description: "Tacos, a snack on the go.",
                 price: 1.99, count: 100),
        FoodPost(name: "Waffle", 
                 picture: UIImage(named: "waffle"),
                 description: "Waffles for breakfast, filling and healthy food.",
                 price: 1.99, count: 100)
    ]
    
    private init() {

    }

    static func getPrivios() -> FoodPost? {
        guard index > 0 else { return nil }
        index -= 1
        return foods[index]
    }
    
    static func getNext() -> FoodPost? {
        guard case 0..<foods.count = index + 1 else { return nil }
        index += 1
        return foods[index]
    }
    
    static func updateCurrentPost(_ post: FoodPost) -> FoodPost? {
        guard case 0..<foods.count = index else { return nil }

        foods[index] = FoodPost(
            name: post.name,
            picture: post.picture,
            description: post.description,
            price: post.price,
            count: post.count
        )
        return foods[index]
    }
}
