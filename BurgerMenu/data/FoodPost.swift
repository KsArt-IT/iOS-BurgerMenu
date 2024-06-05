//
//  FoodPost.swift
//  BurgerMenu
//
//  Created by KsArT on 30.05.2024.
//

import Foundation

struct FoodPost {
    let name: String
    let picture: String
    let caption: String
    var price: Float
    var count: Int
}

final class FoodData{
    
    static var index = -1
    
    private static var foods: [FoodPost]=[
        FoodPost(name: "Burger", picture: "burger",
                 caption: "We have the biggest burgers, at the lowest price.",
                 price: 3.99, count: 100),
        FoodPost(name: "Cake", picture: "cake",
                 caption: "A big piece of lemon pie.",
                 price: 1.99, count: 100),
        FoodPost(name: "Chicken", picture: "chicken", 
                 caption: "Big fried chicken.",
                 price: 5.99, count: 100),
        FoodPost(name: "Donut", picture: "donut", 
                 caption: "The most delicious and biggest donuts!",
                 price: 1.99, count: 100),
        FoodPost(name: "French-fries", picture: "french-fries", 
                 caption: "French fries, very tasty!",
                 price: 2.99, count: 100),
        FoodPost(name: "Hot-dog", picture: "hot-dog",
                 caption: "A hot dog with a delicious smoked sausage.",
                 price: 1.99, count: 100),
        FoodPost(name: "Ice-cream", picture: "ice-cream",
                 caption: "Ice cream, three scoops with three different flavors: lemon, strawberry, vanilla.",
                 price: 1.99, count: 100),
        FoodPost(name: "Japanese-food", picture: "japanese-food", 
                 caption: "Japanese food, several different dishes to introduce you to Japanese cuisine.",
                 price: 6.99, count: 100),
        FoodPost(name: "Kebab", picture: "kebab", 
                 caption: "Kebab, Nesh kebab is the most delicious, you'll lick your fingers!",
                 price: 3.99, count: 100),
        FoodPost(name: "Noodles", picture: "noodles", 
                 caption: "A bowl of hot noodles won't leave you hungry!",
                 price: 4.99, count: 100),
        FoodPost(name: "Pancake", picture: "pancake", 
                 caption: "Pancakes with blueberry jam.",
                 price: 4.99, count: 100),
        FoodPost(name: "Pizza", picture: "pizza",
                 caption: "Pizza with seafood, large size.",
                 price: 2.99, count: 100),
        FoodPost(name: "Sandwich", picture: "sandwich",
                 caption: "Not a big sandwich to just snack on.",
                 price: 1.49, count: 100),
        FoodPost(name: "Spaghetti", picture: "spaghetti", 
                 caption: "A plate of spaghetti, a hearty dinner for you!",
                 price: 1.49, count: 100),
        FoodPost(name: "Sushi", picture: "sushi", 
                 caption: "Large set of sushi 23 pieces.",
                 price: 7.99, count: 100),
        FoodPost(name: "Taco", picture: "taco", 
                 caption: "Tacos, a snack on the go.",
                 price: 1.99, count: 100),
        FoodPost(name: "Waffle", picture: "waffle", 
                 caption: "Waffles for breakfast, filling and healthy food.",
                 price: 1.99, count: 100)
    ]
    
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
    
    static func updateCurrentPost(_ caption: String) -> FoodPost? {
        guard case 0..<foods.count = index else { return nil }
        let oldFood = foods[index]
        foods[index] = FoodPost(
            name: oldFood.name,
            picture: oldFood.picture,
            caption: caption,
            price: oldFood.price,
            count: oldFood.count
        )
        return foods[index]
    }
}
