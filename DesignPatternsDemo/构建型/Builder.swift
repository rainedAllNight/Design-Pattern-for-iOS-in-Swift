//
//  Builder.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/8.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation
import UIKit
/**
 **构建者模式又称生成器模式**
 是一种对象构建模式。它可以将复杂对象的建造过程抽象出来（抽象类别），使这个抽象过程的不同实现方法可以构造出不同表现（属性）的对象
 */
struct TableViewBuilder {
    
    var frame: CGRect?
    var delegate: UITableViewDelegate?
    var dataSource: UITableViewDataSource?
    var cells: [String: UITableViewCell.Type]? //[CellID: Cell.Type]
    
    typealias BuilderClosure = (inout TableViewBuilder) -> ()
    
    init(_ buildClosure: BuilderClosure) {
        buildClosure(&self)
    }
}

extension UITableView {
    convenience init(_ builder: TableViewBuilder) {
        self.init()
        if let frame = builder.frame {
            self.frame = frame
        }
        if let delegate = builder.delegate {
            self.delegate = delegate
        }
        if let dataSource = builder.dataSource {
            self.dataSource = dataSource
        }
        if let cells = builder.cells {
            cells.forEach {
                self.register($1, forCellReuseIdentifier: $0)
            }
        }
    }
}


//用法
class BuilderTest {
    func testBuilder() {
        let tableView = UITableView(TableViewBuilder({ (builder) in
            builder.frame = UIScreen.main.bounds
//            builder.dataSource = self
//            builder.delegate = self
            builder.cells = ["ID": UITableViewCell.self]
        }))
    }
}

