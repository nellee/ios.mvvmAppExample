//
//  Observable.swift
//  ios.mobile-approvals
//
//  Created by Danijel Kunkic on 16/05/2019.
//  Copyright © 2019 Danijel Kunkic. All rights reserved.
//
 import Foundation

class Observable<T: Equatable> {
    private let thread: DispatchQueue
    var property: T? {
        willSet(newValue) {
            if property != newValue {
                thread.async {
                    self.observe?(newValue)
                }
            }
        }
    }
    
    var observe: ((T?) -> Void)?
    
    init(_ value: T? = nil, thread dispatcherThread: DispatchQueue = DispatchQueue.main) {
        self.thread = dispatcherThread
        self.property = value
    }
}
