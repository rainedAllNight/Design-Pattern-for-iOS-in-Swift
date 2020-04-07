//
//  Mediator.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/1.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 ### What
 ````
 用一个中介者对象封装一系列的对象交互，中介者使各对象不需要显示地相互作用，
 从而使耦合松散，而且可以独立地改变它们之间的交互。
 主要是为了降低多个对象与类间的通信复杂性。
 ````
 ### Where
 * 多个类互相引用，互相耦合；
 * 引用多个类，且需要复用
 * 逻辑涉及到多个类
 
 ### How
 一个特别实际的例子就是组件化时利用中介者模式来为各组件模块解耦
 可参考 https://github.com/indulgeIn/YBRouterAndDecouplingDemo
 */



