//
//  State& Strategy.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/2.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 这两种设计模式有很多相似之处，所以比较合适放在一起对比, 详细对比可参考 https://www.zhihu.com/question/23693088
 */

protocol Sort {
    func sort(_ array: inout [Int])
}

struct BubbleSort: Sort {
    func sort(_ array: inout [Int]) {
        print("bubble sort")
    }
}

struct InsertionSort: Sort {
    func sort(_ array: inout [Int]) {
        print("insert sort")
    }
}

struct SelectionSort: Sort {
    func sort(_ array: inout [Int]) {
        print("selection sort")
    }
}

//MARK: -- State

struct StateSort {
    var stateSort: Sort
    
    init(_ sort: Sort) {
        self.stateSort = sort
    }
    
    @discardableResult
    mutating func sort(_ array: inout [Int]) -> [Int] {
        self.stateSort.sort(&array)
        return array
    }
}

//MARK: -- Strategy

enum SortType {
    case bubble
    case insertion
    case selection
}

struct StrategySort {
    private var strategySort: Sort
    
    init(_ strategy: SortType) {
        switch strategy {
        case .bubble:
            self.strategySort = BubbleSort()
        case .insertion:
            self.strategySort = InsertionSort()
        case .selection:
            self.strategySort = SelectionSort()
        }
    }
    
    @discardableResult
    mutating func sort(_ array: inout [Int]) -> [Int] {
        self.strategySort.sort(&array)
        return array
    }
}


//用法
class StateTest {
    func testState() {
        var array: [Int] = [0, 1, 2]
        //冒泡排序
        var stateSort = StateSort(BubbleSort())
        stateSort.sort(&array)
        //选择排序
        stateSort.stateSort = SelectionSort()
        stateSort.sort(&array)
    }
}

class StrategyTest {
    func testStrategy() {
        var array: [Int] = [0, 1, 2]
        //冒泡排序
        var bubbleSort = StrategySort(.bubble)
        bubbleSort.sort(&array)
        //选择排序
        var selectionSort = StrategySort(.selection)
        selectionSort.sort(&array)
    }
}
