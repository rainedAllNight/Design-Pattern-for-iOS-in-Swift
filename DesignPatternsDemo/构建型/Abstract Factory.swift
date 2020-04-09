//
//  Abstract Factory.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/7.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 抽象工厂
 
 为创建一组相关或相互依赖的对象提供一个接口，而且无需指定他们的具体类。
 抽象工厂由多个产品抽象类、一个抽象工厂类、多个具体产品子类、多个具体工厂类组成。当多个产品抽象类中有相同类型的子类的时候，就可以通过抽象工厂模式生成
 */

//产品抽象
protocol FoodDescribing {
    var names: [String] {get}
}


//抽象工厂
protocol CookFactory {
   func cook() -> FoodDescribing
}

//具体工厂

private struct ChineseRestaurant: CookFactory {
    func cook() -> FoodDescribing {
        return Food(names: ["水饺", "西红柿炒蛋", "麻婆豆腐"])
    }
}

private struct WesternRestaurant: CookFactory {
    func cook() -> FoodDescribing {
       return Food(names: ["牛排", "薯条", "各种肉"])
    }
}
//具体产品
struct Food: FoodDescribing {
    var names: [String]
}

//具体工厂
enum CookFactoryType: CookFactory {
    case chinese
    case western
    
    func cook() -> FoodDescribing {
        switch self {
        case .chinese:
            return ChineseRestaurant().cook()
        case .western:
            return WesternRestaurant().cook()
        }
    }
}

//用法
class AbstractFactoryTest {
    func testAbstractFactory() {
        let chineseFood = CookFactoryType.chinese.cook()
        let westernFood = CookFactoryType.western.cook()
        print("\(chineseFood.names) \(westernFood.names)")
    }
}
