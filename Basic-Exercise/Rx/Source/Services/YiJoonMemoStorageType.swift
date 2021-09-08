//
//  YiJoonMemoStorageType.swift
//  Rx
//
//  Created by Yi Joon Choi on 2021/09/08.
//

import Foundation
import RxSwift

protocol YiJoonMemoStorageType{
    @discardableResult
    func createMemo(content: String) -> Observable<YiJoonMemo>
    
    @discardableResult
    func memoList() -> Observable<[YiJoonMemo]>
    
    @discardableResult
    func update(memo: YiJoonMemo, content: String) -> Observable<YiJoonMemo>
    
    @discardableResult
    func delete(memo: YiJoonMemo) -> Observable<YiJoonMemo>
}
