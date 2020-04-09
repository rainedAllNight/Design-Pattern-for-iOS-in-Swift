//
//  DesignPatternsDemoTests.swift
//  DesignPatternsDemoTests
//
//  Created by rainedAllNight on 2020/3/31.
//  Copyright © 2020 luowei. All rights reserved.
//

import XCTest
@testable import DesignPatternsDemo

class DesignPatternsDemoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testForChainOfResponsibility() {
        let jackMa = Interviewer(name: "张三", age: 27, workingExperience: 4, skills: ["Swift", "Objective-C", "Data Structure", "Network", "RxSwift"])
        
        //handle chain
        let cto = CTO(next: nil)
        let projectLeader = ProjectLeader(next: cto)
        let hr = HR(next: projectLeader)
        
        let recruitment = Recruitment(hr)
        XCTAssert(recruitment.audit(jackMa), "您已进入我司人才库")
    }
    
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
    
    func testIterator() {
        let album = PhotoAlbum(photos: [Photo(name: "🖼"),
                                        Photo(name: "🐰"),
                                        Photo(name: "🙅‍♀️")])
        for photo in album {
            print("view a photo: \(photo)")
        }
    }
    
    func testMemenot() {
        var human = Human(age: 14, height: 140, name: "Jack", weight: 35)
        for _ in 0..<10 {
            human.age += 1
            human.height += 3
            MementoManager.save(human)
        }
        print("age: \(human.age) height: \(human.height)")
        
        ///恢复到20岁的状态
        MementoManager.restore(&human, age: 18)
        print("age: \(human.age) height: \(human.height)")
    }
    
    func testStrategy() {
        var array: [Int] = [0, 1, 2]
        //冒泡排序
        var bubbleSort = StrategySort(.bubble)
        bubbleSort.sort(&array)
        //选择排序
        var selectionSort = StrategySort(.selection)
        selectionSort.sort(&array)
    }
    
    func testState() {
        var array: [Int] = [0, 1, 2]
        //冒泡排序
        var stateSort = StateSort(BubbleSort())
        stateSort.sort(&array)
        //选择排序
        stateSort.stateSort = SelectionSort()
        stateSort.sort(&array)
    }
    
    func testSimpleFactory() {
        let programmer = ProgrammingFactory.create(.iOS)
        print("\(programmer.coding())")
    }
    
    func testFactoryMethod() {
        let fruit = AppleFactory.createFruit()
        fruit.decay()
    }
    
    func testAbstractFactory() {
        let chineseFood = CookFactoryType.chinese.cook()
        let westernFood = CookFactoryType.western.cook()
        print("\(chineseFood.names) \(westernFood.names)")
    }
    
    func testBuilder() {
        let tableView = UITableView(TableViewBuilder({ (builder) in
            builder.frame = UIScreen.main.bounds
//            builder.dataSource = self
//            builder.delegate = self
            builder.cells = ["ID": UITableViewCell.self]
        }))
    }
    
    func testPrototype() {
        let cell = Cell("白细胞")
        let newCell = cell.copy()
    }
    
    func testBridge() {
        let tvRemoteControl = RemoteControl(appliance: TV())
        tvRemoteControl.turnOn()

        let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
        fancyVacuumCleanerRemoteControl.turnOn()
    }
    
    func testComposite() {
        let whiteboard = Whiteboard(Circle(), Polygon())
        whiteboard.draw(UIColor.red)
    }
    
    func testFacade() {
        let store = Default()
        store["id"] = "ue29eu9"
        let id = store["id"]
        print(id)
    }
}
