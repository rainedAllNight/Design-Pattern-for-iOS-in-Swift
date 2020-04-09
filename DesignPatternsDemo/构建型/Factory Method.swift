//
//  Factory Method.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/7.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 工厂方法
 定义一个创建对象的接口，但让实现这个接口的类来决定实例化哪个类。工厂方法让类的实例化推迟到子类中进行。
 */

//抽象工厂
protocol FruitFactory {
    static func createFruit() -> Fruit
}

//抽象产品
protocol Fruit {
    var name: String {get}
    func decay()
}

//具体工厂
struct AppleFactory: FruitFactory {
    static func createFruit() -> Fruit {
        return Apple()
    }
}

struct BananaFactory: FruitFactory {
    static func createFruit() -> Fruit {
        return Banana()
    }
}

//具体产品
struct Apple: Fruit {
    var name: String {
        return "Apple"
    }
    
    func decay() {
        print("\(name)has decay")
    }
}

struct Banana: Fruit {
    var name: String {
        return "Banana"
    }
    
    func decay() {
        print("\(name)has decay")
    }
}


//用法
class FactoryMethodTest {
    func testFactoryMethod() {
        let fruit = AppleFactory.createFruit()
        fruit.decay()
    }
}


