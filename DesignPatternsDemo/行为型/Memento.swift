//
//  Memento.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/2.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 ### What
 ```
 在不破坏封闭的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。
 这样以后就可将该对象恢复到原先保存的状态。
 ````
 ### Where
 * 功能比较复杂的，但是需要维护或记录属性历史的类。
 * 需要保存的属性只是众多属性的一小部分时。
 
 一般而言，运用备忘录的思想很多，完整的运用备忘录模式的很少。
 
 ### How
 1.在使用类中引用备忘录类，实现保存与恢复两个方法
 2.通过管理对象，取出或者保存使用类需要的对象
 */

protocol MementoConvertible {
    var age: Int {get set}
    var height: Float {get set}
}

struct HumanState: MementoConvertible {
    var age: Int
    
    var height: Float
}

struct Human: MementoConvertible {
    var age: Int
    
    var height: Float
    
    var name: String
    
    var weight: Float
}

struct MementoManager {
    static var mementos = [Int: MementoConvertible]()
    
    static func save(_ state: MementoConvertible) {
        mementos[state.age] = state
    }
    
    static func restore(_ human: inout Human, age: Int) {
        human.age = age
        if let height = mementos[age]?.height {
            human.height = height
        }
    }
}




