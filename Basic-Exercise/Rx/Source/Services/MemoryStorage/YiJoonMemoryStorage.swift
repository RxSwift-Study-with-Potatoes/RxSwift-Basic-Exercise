//
//  YiJoonMemoryStorage.swift
//  Rx
//
//  Created by Yi Joon Choi on 2021/09/08.
//

import Foundation
import RxSwift

class MemoryStorage: YiJoonMemoStorageType{
    private var list = [
        YiJoonMemo(content: "Hello, rxSwift", insertDate: Date().addingTimeInterval(-10)),
        YiJoonMemo(content: "Hello, rxSwift2", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[YiJoonMemo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<YiJoonMemo> {
        let memo = YiJoonMemo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    func memoList() -> Observable<[YiJoonMemo]> {
        return store
    }
    
    func update(memo: YiJoonMemo, content: String) -> Observable<YiJoonMemo> {
        let updated = YiJoonMemo(original: memo, updateContent: content)
        
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    func delete(memo: YiJoonMemo) -> Observable<YiJoonMemo> {
        if let index = list.firstIndex(where: {$0 == memo}){
            list.remove(at: index)
        }
        
        store.onNext(list)
    
        return Observable.just(memo)
    }
    
}
