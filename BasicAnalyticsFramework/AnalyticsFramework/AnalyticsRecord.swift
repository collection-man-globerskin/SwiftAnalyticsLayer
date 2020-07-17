//
//  AnalyticsRecord.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import Foundation

protocol AnalyticsRecord {
    var type: String { get }
    var storage: AnalyticsMetadata { get }
    
    init(type: String)
    
    func set(value: Value, for key: Key)
    func get(by key: Key) -> Value?
}

class DummyAnalyticsRecord: AnalyticsRecord {
    var type: String
    var storage: AnalyticsMetadata = [:]
    
    required init(type: String) {
        self.type = type
    }
    
    func set(value: Value, for key: Key) {
        storage[key] = value
    }
    
    func get(by key: Key) -> Value? {
        return storage[key]
    }
}
