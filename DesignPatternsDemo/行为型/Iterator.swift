//
//  Iterator.swift
//  DesignPatternsDemo
//
//  Created by rainedAllNight on 2020/4/1.
//  Copyright © 2020 luowei. All rights reserved.
//

import Foundation

/**
 ### What
 迭代器模式可以让用户通过特定的接口巡访容器中的每一个元素而不用了解底层的实现。
 
 ### Where
 * 需要访问组合对象的内容又不暴露内部表示
 * 通过多种方式遍历组合数组
 * 通过一个统一接口，遍历各种类型的组合对象
 
 ### How
如果你会使用数组和字典，那么你就会使用迭代器
 */

struct Photo {
    let name: String
}

struct PhotoAlbum {
    var photos: [Photo]
}

struct PhotoAlbumIterator: IteratorProtocol {
    typealias Element = Photo
    
    private var currentIndex = 0
    private var album: [Photo]
    
    init(_ album: [Photo]) {
        self.album = album
    }
    
    mutating func next() -> Photo? {
        defer {currentIndex += 1}
        return album.count > currentIndex ? album[currentIndex] : nil
    }
}

extension PhotoAlbum: Sequence {
    typealias Iterator = PhotoAlbumIterator
    
    __consuming func makeIterator() -> PhotoAlbumIterator {
        return PhotoAlbumIterator(photos)
    }
}




