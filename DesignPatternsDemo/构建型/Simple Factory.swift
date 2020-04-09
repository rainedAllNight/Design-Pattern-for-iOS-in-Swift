//
//  Simple Factory.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/7.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 简单工厂
 三种工厂的解释可参考 https://www.jianshu.com/p/847af218b1f0，这里只做Swift版的实现
 */

protocol Programmer {
    var language: String {get}
    var IDE: String {get}
    func coding() -> String
}

struct iOSer: Programmer {
    var language: String {
        return "Swift"
    }
    
    var IDE: String {
        return "Xcode"
    }
    
    func coding() -> String {
        return "iOS: Use the \(language) language coding on \(IDE)"
    }
}

struct Backgrounder: Programmer {
    var language: String {
        return "Java"
    }
    
    var IDE: String {
        return "IDEA"
    }
    
    func coding() -> String {
        return "Background: Use the \(language) language coding on \(IDE)"
    }
}

enum CoderType {
    case iOS
    case background
}

struct ProgrammingFactory {
    static func create(_ type: CoderType) -> Programmer {
        switch type {
        case .iOS:
            return iOSer()
        case .background:
            return Backgrounder()
        }
    }
}

//用法
class SimpleFactoryTest {
    func testSimpleFactory() {
        let programmer = ProgrammingFactory.create(.iOS)
        print("\(programmer.coding())")
    }
}
