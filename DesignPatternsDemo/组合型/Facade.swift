//
//  Facade.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
/**
 ## 外观模式
 为子系统中的一组接口提供一个一致的界面，定义一个高层接口，这个接口使得这一子系统更加容易使用。可参考 https://www.jianshu.com/p/48fe877054d7
 */
class Default {
    private let defaults: UserDefaults
    
    init(_ defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }

        set {
            defaults.set(newValue, forKey: key)
        }
    }
}

//用法
private class FacadeTest {
   func testFacade() {
        let store = Default()
        store["id"] = "ue29eu9"
        let id = store["id"]
        print(id)
    }
}
