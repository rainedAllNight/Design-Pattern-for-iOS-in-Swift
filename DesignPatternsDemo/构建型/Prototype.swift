//
//  Prototype.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
/**
 ## 原型
 通过“复制”一个已经存在的实例来返回新的实例,而不是新建实例。被复制的实例就是我们所称的“原型”，这个原型是可定制的。
 */

///最简单的例子就是NSCopying协议
class Cell: NSCopying {
   
    var type: String
    let health: Int = 1
    
    init(_ type: String) {
        self.type = type
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
           return Cell(type)
    }
}

//用法
class PrototypeTest {
    func testPrototype() {
        let cell = Cell("白细胞")
        let newCell = cell.copy()
    }
}
