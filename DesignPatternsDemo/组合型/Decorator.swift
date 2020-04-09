//
//  Decorator.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
import UIKit
/**
 ## 装饰器模式
 在不必改变原类文件和使用继承的情况下，动态地扩展一个对象的功能。
 
 Category的使用就是一种装饰器模式
 */

extension UIView {
    func setCircular(_ value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}

///或者

protocol Circularable {
    func setCircular(_ value: CGFloat)
}

extension Circularable where Self: UIView {
    func setCircular(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
