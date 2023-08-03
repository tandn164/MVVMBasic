//
//  Observable.swift
//  MVVM
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import Foundation

class Observable<T>: NSObject {
    
    typealias CompletionHandler = ((T?) -> Void)
    
    var value : T? {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init( value: T?) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}
