//
//  Command.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/3/31.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
/**
 [命令模式简单介绍](https://www.jianshu.com/p/ed4d5c8a4faa)
 */
///例子场景-股票交易, 用法见 DesignPatternsDemoTests

let SingleDealAmount: Double = 100

protocol ShareDealingCommand {
    func excute(_ amount: inout Double)
    func undo(_ amount: inout Double)
}

struct Buy: ShareDealingCommand {
    func excute(_ amount: inout Double) {
        amount -= SingleDealAmount
    }
    
    func undo(_ amount: inout Double) {
        amount += SingleDealAmount
    }
}

struct Sale: ShareDealingCommand {
    
    func excute(_ amount: inout Double) {
        amount += SingleDealAmount
    }
    
    func undo(_ amount: inout Double) {
        amount -= SingleDealAmount
    }
}

struct Trader {
    let buyCommand: Buy
    let saleCommand: Sale
    var lastCommand: ShareDealingCommand?
    var availableAmount: Double //可用金
    
    init(_ saleCommand: Sale,
         buyCommand: Buy,
         availableAmount: Double = SingleDealAmount * 100) {
        self.saleCommand = saleCommand
        self.buyCommand = buyCommand
        self.availableAmount = availableAmount
    }
    
    mutating func sale() {
        saleCommand.excute(&availableAmount)
        lastCommand = saleCommand
    }
    
    mutating func buy() {
        buyCommand.excute(&availableAmount)
        lastCommand = buyCommand
    }
    
    mutating func undo() {
        lastCommand?.undo(&availableAmount)
    }
}


//用法
class CommandTest {
    func testCommand() {
        let saleCommand = Sale()
        let buyCommand = Buy()
        var trader = Trader(saleCommand, buyCommand: buyCommand, availableAmount: 1000)
        trader.buy()
        trader.buy()
        print(trader.availableAmount)
        trader.sale()
        print(trader.availableAmount)
        trader.undo()
        print(trader.availableAmount)
    }
}


