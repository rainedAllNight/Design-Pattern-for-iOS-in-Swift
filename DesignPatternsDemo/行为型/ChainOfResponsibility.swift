//
//  ChainOfResponsibility.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/3/31.
//  Copyright © 2020 luowei. All rights reserved.
//

/**
 
 ### What
 在责任链模式里，很多对象由每一个对象对其下家的引用而连接起来形成一条链。请求在这个链上传递，直到链上的某一个对象决定处理此请求
 责任链中主要有两个属性：
 * 链接下一个对象的属性
 * 对应的响应方法
 
 ### Where
 * 有多个对象可以处理同一个请求，动态确定谁可以处理该请求
 * 不明确指定接受者的情况下，给多个对象中的其中一个对象发送请求
 * 动态指定一组对象实现请求
  虽然说责任链一般是指当一个对象可以处理时候停止传递，但是在有需求的时候，就算不停止传递也没有关系
 
 ### How
 例子可能不是特别合适
 ⬇️
 用法见 DesignPatternsDemoTests
 */


import Foundation

struct Interviewer {
    
    var name: String
    
    var age: Int
    
    var workingExperience: Float
    
    var skills: [String]
}


protocol Interview {
    func audit(_ interviewer: Interviewer) -> Bool
    var next: Interview? {get}
}

/// 删选的参数可配置，这里简化，写死在内部
// MARK: - Chain Of Responsibility

struct HR: Interview {
    
    var next: Interview?
    
    func audit(_ interviewer: Interviewer) -> Bool {
        if interviewer.age > 35 || interviewer.workingExperience < 3 {
            return false
        } else {
            return next?.audit(interviewer) ?? true
        }
    }
}

struct ProjectLeader: Interview {
    
    var next: Interview?
    
    func audit(_ interviewer: Interviewer) -> Bool {
        let requiredSkills = ["Swift", "Objective-C", "RxSwift", "Audio/Video"]
        let score = interviewer.skills.reduce(0) { (result, skill) -> Int in
            let score = requiredSkills.contains(skill) ? 1 : 0
            return result + score
        }
        if score >= 3 {
            return next?.audit(interviewer) ?? true
        } else {
            return false
        }
    }
}

struct CTO: Interview {
    
    var next: Interview?
    
    func audit(_ interviewer: Interviewer) -> Bool {
        let requiredSkills = ["Data Structure", "Network", "Algorithm"]
        let score = interviewer.skills.reduce(0) { (result, skill) -> Int in
            let score = requiredSkills.contains(skill) ? 1 : 0
            return result + score
        }
        if score >= 2 {
            return next?.audit(interviewer) ?? true
        } else {
            return false
        }
    }
}

struct Recruitment: Interview {
    var next: Interview?
    
    private var start: Interview
    
    init(_ start: Interview) {
        self.start = start
    }
    
    func audit(_ interviewer: Interviewer) -> Bool {
        return start.audit(interviewer)
    }
}


