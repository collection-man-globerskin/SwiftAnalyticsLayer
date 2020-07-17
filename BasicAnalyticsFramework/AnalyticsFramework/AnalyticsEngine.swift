//
//  AnalyticsEngine.swift
//  BasicAnalyticsFramework
//
//  Created by Julian Llorensi on 16/07/2020.
//  Copyright © 2020 Julian Llorensi. All rights reserved.
//

import Foundation

protocol AnalyticsEngine: class {
    func sendAnalyticsEvent(named name: String, metadata: AnalyticsMetadata)
}

final class DummyAnalyticsEngine: AnalyticsEngine {
    private let database: DummyAnalyticsDatabase
    
    init(database: DummyAnalyticsDatabase = DummyAnalyticsDatabase()) {
        self.database = database
    }
    
    func sendAnalyticsEvent(named name: String, metadata: AnalyticsMetadata) {
        let record = DummyAnalyticsRecord(type: "AnalyticsEvent.\(name)")
        
        for (key, value) in metadata {
            record.set(value: value, for: key)
        }
        
        database.save(record) { result in
            switch result {
            case .success(let record):
                print("Event: \(record.type) with data \(record.storage)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
