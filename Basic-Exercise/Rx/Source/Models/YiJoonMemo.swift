//
//  YiJoonMemo.swift
//  Rx
//
//  Created by Yi Joon Choi on 2021/09/08.
//

import Foundation

struct YiJoonMemo : Equatable {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date())
    {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: YiJoonMemo, updateContent: String)
    {
        self = original
        self.content = updateContent
    }
}
