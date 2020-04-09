//
//  Bridge.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 桥接模式将抽象部分与实现部分分离，使它们都可以独立的变化。
 */

//抽象部分
protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance {
    func run()
}


final class RemoteControl: Switch {
    var appliance: Appliance

    func turnOn() {
        self.appliance.run()
    }
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

//实现部分
final class TV: Appliance {
    func run() {
        print("tv turned on");
    }
}

final class VacuumCleaner: Appliance {
    func run() {
        print("vacuum cleaner turned on")
    }
}


//用法
class BridgeTest {
    func testBridge() {
        let tvRemoteControl = RemoteControl(appliance: TV())
        tvRemoteControl.turnOn()

        let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
        fancyVacuumCleanerRemoteControl.turnOn()
    }
}
