//
//  Composite.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
import UIKit

/**
 将对象组合成树形结构以表示‘部分-整体’的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。

 */

protocol Shape {
    func draw(_ color: UIColor)
}

class Polygon: Shape {
    func draw(_ color: UIColor) {
        print("draw a polygon with color \(color)")
    }
}

class Circle: Shape {
    func draw(_ color: UIColor) {
        print("draw a circle with color \(color)")
    }
}

//组合

class Whiteboard: Shape {
    private lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(_ color: UIColor) {
        shapes.forEach {
            $0.draw(color)
        }
    }
}

